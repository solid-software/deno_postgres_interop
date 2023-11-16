// This is an internal implementation so it is okay here.
// ignore_for_file: public_member_api_docs

import 'package:collection/collection.dart';
import 'package:deno_postgres_interop/src/add_imports/better_map.dart';
import 'package:deno_postgres_interop/src/add_imports/class_interop_data.dart';
import 'package:yaml/yaml.dart';

class Config {
  final String fileUrlPrefix;
  final Map<String, List<ClassInteropData>> classesMap;

  Set<ClassInteropData> get classes => classesMap.values.flattened.toSet();

  Config({required this.fileUrlPrefix, required this.classesMap});

  factory Config.fromYaml(String yamlString) {
    try {
      final {
        'classes_map': YamlMap classesYamlMap,
        'file_url_prefix': String fileUrlPrefix,
      } = loadYaml(yamlString) as YamlMap;

      final classesMap = classesYamlMap
          .cast<String, YamlList>()
          .mapValues(ClassInteropData.fromYamlList);

      return Config(
        classesMap: classesMap,
        fileUrlPrefix: fileUrlPrefix,
      );
    } catch (_) {
      throw YamlException('', null);
    }
  }

  String _filenameForClass(String classname) => classesMap
      .firstWhereValue((v) => v.map((e) => e.jsName).contains(classname))
      .key;

  String importStringForClass(String classname) {
    final filename = _filenameForClass(classname);
    final url = '$fileUrlPrefix$filename';

    return 'import { $classname } from "$url";';
  }
}
