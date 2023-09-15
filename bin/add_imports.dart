// This is a CLI tool so it is okay here.
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/args.dart';
import 'package:collection/collection.dart';
import 'package:deno_postgres_interop/src/add_imports/args.dart';
import 'package:deno_postgres_interop/src/add_imports/config.dart';
import 'package:yaml/yaml.dart';

void main(List<String> arguments) {
  try {
    final Args(:filename, :configpath) = Args.parse(arguments);

    final configString = File(configpath).readAsStringSync();
    final config = Config.fromYaml(configString);

    final sourceFile = File(filename);
    final sourceString = sourceFile.readAsStringSync();
    final newSource = createNewSource(sourceString, config);
    if (newSource == sourceString) return;

    sourceFile.writeAsStringSync(newSource);
  } on FileSystemException catch (e) {
    print('Error while accessing ${e.path}');
  } on YamlException {
    print('Error while parsing config');
  } on ArgParserException {
    print(Args.usage);
  }
}

String createNewSource(String sourceString, Config config) {
  final classes = RegExp(r'new self.([A-Za-z]+)\(')
      .allMatches(sourceString)
      .map((e) => e.group(1))
      .whereNotNull()
      .toSet()
      .intersection(config.classes)
      .whereNot((e) => sourceString.contains('import { $e }'))
      .toList();

  return [
    ...[config.importStringForClass, (e) => 'self.$e = $e;']
        .map(classes.map)
        .flattened,
    sourceString,
  ].join('\n');
}
