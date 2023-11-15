// This is an internal implementation so it is okay here.
// ignore_for_file: public_member_api_docs

import 'package:collection/collection.dart';
import 'package:yaml/yaml.dart';

class Config {
  final String fileUrlPrefix;
  final Map<String, List<(String, String)>> classesMap;

  Set<(String, String)> get classes => classesMap.values.flattened.toSet();

  Config({required this.fileUrlPrefix, required this.classesMap});

  factory Config.fromYaml(String yamlString) {
    try {
      final parsedYaml = loadYaml(yamlString) as YamlMap;

      final classesMap = (parsedYaml['classes_map'] as YamlMap).map(
        (key, value) => MapEntry(
          key as String,
          [...value as YamlList]
              .map(
                (e) => e is YamlMap
                    ? (e.keys.first as String, e.values.first as String)
                    : (e as String, e),
              )
              .toList(),
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
          (classnamePair) => classnamePair.$1 == classname,
        ),
      )
      .key;

  String importStringForClass(String classname) {
    final filename = _filenameForClass(classname);
    final url = '$fileUrlPrefix$filename';

    return 'import { $classname } from "$url";';
  }
}
