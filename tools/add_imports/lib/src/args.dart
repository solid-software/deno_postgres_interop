import 'package:args/args.dart';

class Args {
  static final parser = ArgParser()
    ..addOption('filename')
    ..addOption('configpath', defaultsTo: 'add_imports.yaml');

  final String filename;
  final String configpath;

  static String get usage => parser.usage;

  Args({required this.filename, required this.configpath});

  factory Args.parse(List<String> arguments) {
    final result = parser.parse(arguments);

    return Args(
      filename: result['filename'] as String,
      configpath: result['configpath'] as String,
    );
  }
}
