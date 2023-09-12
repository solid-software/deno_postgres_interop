import 'dart:io';

import 'package:add_imports/src/args.dart';
import 'package:add_imports/src/config.dart';
import 'package:add_imports/src/function_or_null.dart';
import 'package:collection/collection.dart';

void main(List<String> arguments) {
  final state = init(arguments);
  if (state == null) return;

  final (sourceFile, config) = state;

  final sourceString = sourceFile.readAsStringSync.orNull();
  if (sourceString == null) {
    print('Error while reading source from "${sourceFile.path}"');

    return;
  }

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
    ...imports,
    ...inits,
    sourceString,
  ].join('\n');

  try {
    sourceFile.writeAsStringSync(newSource);
  } catch (_) {
    print('Error while writing new source to "${sourceFile.path}"');

    return;
  }
}

(File, Config)? init(List<String> arguments) {
  final args = (() => Args.parse(arguments)).orNull();
  if (args == null) {
    print(Args.usage);

    return null;
  }

  final config = (() => Config.fromYaml(
        File(args.configpath).readAsStringSync(),
      )).orNull();

  if (config == null) {
    print('Error while reading config from "${args.configpath}"');

    return null;
  }

  return (File(args.filename), config);
}
