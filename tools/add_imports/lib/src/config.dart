import 'package:collection/collection.dart';
import 'package:yaml/yaml.dart';

class Config {
  final String fileUrlPrefix;
  final Map<String, List<String>> classesMap;

  Set<String> get classes => classesMap.values.flattened.toSet();

  Config({required this.fileUrlPrefix, required this.classesMap});

  factory Config.fromYaml(String yamlString) {
    final parsedYaml = loadYaml(yamlString) as YamlMap;

    final classesMap = (parsedYaml['classes_map'] as YamlMap).map(
      (key, value) => MapEntry(
        key as String,
        [...value as YamlList].cast<String>(),
      ),
    );

    return Config(
      classesMap: classesMap,
      fileUrlPrefix: parsedYaml['file_url_prefix'] as String,
    );
  }

  String _filenameForClass(String classname) =>
      classesMap.entries.firstWhere((e) => e.value.contains(classname)).key;

  String importStringForClass(String classname) {
    final filename = _filenameForClass(classname);
    final url = '$fileUrlPrefix$filename';

    return 'import { $classname } from "$url";';
  }
}
