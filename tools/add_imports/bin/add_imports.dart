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

    final classes = RegExp(r'new self.([A-Za-z]+)\(')
        .allMatches(sourceString)
        .map((e) => e.group(1))
        .whereNotNull()
        .toSet()
        .intersection(config.classes)
        .whereNot((e) => sourceString.contains('import { $e }'))
        .toList();

    if (classes.isEmpty) return;

    final imports = classes.map(
      (classname) {
        final filename = config.filenameForClass(classname);
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
