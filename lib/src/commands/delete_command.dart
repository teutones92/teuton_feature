// ignore_for_file: avoid_print

import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as p;

import '../config.dart';
import 'utils.dart';

class DeleteCommand {
  void run(List<String> params) {
    final parser = ArgParser()
      ..addFlag('force',
          abbr: 'f', negatable: false, help: 'Do not ask for confirmation')
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
      printInfo('Usage: delete <name> [options]');
      print(blue(parser.usage));
      return;
    }

    final rest = argResults.rest;
    if (rest.isEmpty) {
      printError('You must specify the feature to delete.');
      print(blue('Usage: delete <name> [options]'));
      return;
    }

    final feature = rest.first.toLowerCase();
    final cfg = TeutonConfig.load();
    final root = (argResults['path'] as String?) ?? cfg.featuresPath;
    final dir = Directory(p.join(root, feature));

    if (!dir.existsSync()) {
      printError('The feature "$feature" does not exist.');
      return;
    }

    final force = argResults['force'] == true;
    if (!force) {
      stdout.write('Are you sure you want to delete "$feature"? (y/n): ');
      final confirm = stdin.readLineSync()?.toLowerCase();
      if (confirm != 'y') {
        printInfo('Operation canceled.');
        return;
      }
    }

    dir.deleteSync(recursive: true);
    printSuccess('Feature "$feature" deleted.');
  }
}
