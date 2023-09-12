import 'dart:io';

import 'package:add_imports/src/args.dart';
import 'package:add_imports/src/config.dart';
import 'package:add_imports/src/util.dart';
import 'package:collection/collection.dart';

void main(List<String> arguments) {
  try {
    final (sourceFile, config) = init(arguments);

    final sourceString = mapException(
      sourceFile.readAsStringSync,
      (_) => 'Error while reading source from "${sourceFile.path}"',
    );

    final newSource = createNewSource(sourceString, config);
    if (newSource == sourceString) return;

    mapException(
      () => sourceFile.writeAsStringSync(newSource),
      (_) => 'Error while writing new source to "${sourceFile.path}"',
    );
  } on String catch (e) {
    print(e);
  }
}

(File, Config) init(List<String> arguments) {
  final Args(
    :filename,
    :configpath,
  ) = mapException(() => Args.parse(arguments), (_) => Args.usage);

  final config = mapException(
    () => Config.fromYaml(
      File(configpath).readAsStringSync(),
    ),
    (_) => 'Error while reading config from "$configpath"',
  );

  return (File(filename), config);
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
    ...[config.importStringForClass, (e) => 'self.$e = $e']
        .map(classes.map)
        .flattened,
    sourceString,
  ].join('\n');
}
