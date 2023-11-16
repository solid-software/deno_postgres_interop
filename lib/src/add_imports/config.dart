// This is an internal implementation so it is okay here.
// ignore_for_file: public_member_api_docs

import 'package:collection/collection.dart';
import 'package:deno_postgres_interop/src/add_imports/class_interop_data.dart';
import 'package:yaml/yaml.dart';

class Config {
  final String fileUrlPrefix;
  final Map<String, List<ClassInteropData>> classesMap;

  Set<ClassInteropData> get classes => classesMap.values.flattened.toSet();

  Config({required this.fileUrlPrefix, required this.classesMap});

  factory Config.fromYaml(String yamlString) {
    try {
      final parsedYaml = loadYaml(yamlString) as YamlMap;

      final classesMap = (parsedYaml['classes_map'] as YamlMap).map(
        (key, value) => MapEntry(
          key as String,
          ClassInteropData.fromYamlList(value as YamlList),
        ),
      );

      return Config(
        classesMap: classesMap,
        fileUrlPrefix: parsedYaml['file_url_prefix'] as String,
      );
    } catch (_) {
      throw YamlException('', null);
    }
  }

  String _filenameForClass(String classname) => classesMap.entries
      .firstWhere(
        (e) => e.value.any(
          (classnamePair) => classnamePair.jsName == classname,
        ),
      )
      .key;

  String importStringForClass(String classname) {
    final filename = _filenameForClass(classname);
    final url = '$fileUrlPrefix$filename';

    return 'import { $classname } from "$url";';
  }
}
