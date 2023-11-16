// This is an internal implementation so it is okay here.
// ignore_for_file: public_member_api_docs

import 'package:yaml/yaml.dart';

class ClassInteropData {
  final String jsName;
  final String alias;

  ClassInteropData({required this.jsName, required this.alias});

  ClassInteropData.noAlias(this.jsName) : alias = jsName;

  static List<ClassInteropData> fromYamlList(YamlList list) => list
      .map(
        (e) => e is YamlMap
            ? ClassInteropData(
                jsName: e.keys.first as String,
                alias: e.values.first as String,
              )
            : ClassInteropData.noAlias(e as String),
      )
      .toList();
}
