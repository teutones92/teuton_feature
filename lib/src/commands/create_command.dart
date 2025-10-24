// ignore_for_file: avoid_print

import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as p;

import '../config.dart';
import '../feature_generator.dart';
import 'utils.dart';

class CreateCommand {
  void run(List<String> params) {
    final parser = ArgParser()
      ..addOption('path',
          abbr: 'p', help: 'Base features path (overrides config)')
      ..addOption('template',
          abbr: 't', help: 'Template to use (default|minimal)')
      ..addFlag('dry-run',
          negatable: false, help: 'Simulate without writing files')
      ..addFlag('verbose', abbr: 'v', negatable: false, help: 'Verbose output')
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
      printInfo('Usage: create <name> [options]');
      print(blue(parser.usage));
      return;
    }

    final rest = argResults.rest;
    if (rest.isEmpty) {
      printError('You must specify the feature name.');
      print(blue('Usage: create <name> [options]'));
      return;
    }

    final feature = rest.first.toLowerCase();
    final cfg = TeutonConfig.load();
    final root = (argResults['path'] as String?) ?? cfg.featuresPath;
    final exists = Directory(p.join(root, feature)).existsSync();

    if (exists) {
      printWarn('The feature "$feature" already exists.');
      return;
    }

    printInfo('Creating feature "$feature"...');
    FeatureGenerator(config: cfg).generate(CreateOptions(
      feature: feature,
      customPath: argResults['path'] as String?,
      template: argResults['template'] as String?,
      dryRun: argResults['dry-run'] == true,
      verbose: argResults['verbose'] == true,
    ));
  }
}
