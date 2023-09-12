import 'dart:io';

import 'package:add_imports/src/args.dart';
import 'package:add_imports/src/config.dart';
import 'package:add_imports/src/function_or_null.dart';
import 'package:collection/collection.dart';

void main(List<String> arguments) {
  final args = (() => Args.parse(arguments)).orNull();
  if (args == null) {
    print(Args.usage);

    return;
  }

  final config = (() => Config.fromYaml(
        File(args.configpath).readAsStringSync(),
      )).orNull();

  if (config == null) {
    print('Error while reading config from "${args.configpath}"');

    return;
  }

  final sourceFile = File(args.filename);
  final sourceString = sourceFile.readAsStringSync();

  final classes = RegExp(r'new self.([A-Za-z]+)\(')
      .allMatches(sourceString)
      .map((e) => e.group(1))
      .whereNotNull()
      .toSet()
      .intersection(config.classesMap.values.flattened.toSet())
      .whereNot((e) => sourceString.contains('import { $e }'))
      .toList();

  if (classes.isEmpty) return;

  final imports = classes.map(
    (classname) {
      final filename = config.classesMap.entries
          .firstWhere((e) => e.value.contains(classname))
          .key;

      final url = '${config.fileUrlPrefix}$filename';

      return 'import { $classname } from "$url";';
    },
  );

  final inits = classes.map((e) => 'self.$e = $e');

  final newSource = [
    imports.join('\n'),
    inits.join('\n'),
    sourceString,
  ].join('\n');

  sourceFile.writeAsStringSync(newSource);
}
