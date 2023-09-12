import 'package:args/args.dart';

class Args {
  static final _parser = ArgParser()
    ..addOption('filename')
    ..addOption('configpath', defaultsTo: 'add_imports.yaml');

  final String filename;
  final String configpath;

  static String get usage => _parser.usage;

  Args({required this.filename, required this.configpath});

  factory Args.parse(List<String> arguments) {
    try {
      final result = _parser.parse(arguments);

      return Args(
        filename: result['filename'] as String,
        configpath: result['configpath'] as String,
      );
    } catch (_) {
      throw ArgParserException('');
    }
  }
}
