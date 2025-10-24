// ignore_for_file: avoid_print

import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as p;

import '../config.dart';
import 'utils.dart';

class ListCommand {
  void run(List<String> params) {
    final parser = ArgParser()
      ..addOption('path',
          abbr: 'p', help: 'Base features path (overrides config)')
      ..addFlag('help', abbr: 'h', negatable: false, help: 'Show usage');

    ArgResults argResults;
    try {
      argResults = parser.parse(params);
    } catch (e) {
      printError(e.toString());
      print(blue(parser.usage));
      return;
    }

    if (argResults['help'] == true) {
      printInfo('Usage: list [options]');
      print(blue(parser.usage));
      return;
    }

    final cfg = TeutonConfig.load();
    final root = (argResults['path'] as String?) ?? cfg.featuresPath;
    final dir = Directory(root);
    if (!dir.existsSync()) {
      printError('The lib/features folder does not exist.');
      return;
    }

    final features = dir.listSync().whereType<Directory>();
    if (features.isEmpty) {
      printWarn('No features created.');
      return;
    }

    printInfo('Existing features:');
    for (var f in features) {
      print('  - ${green(p.basename(f.path))}');
    }
  }
}
