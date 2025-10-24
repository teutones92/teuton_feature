import 'dart:io';

import 'package:path/path.dart' as p;

import 'commands/utils.dart';
import 'config.dart';
import 'templates/templates.dart';

/// Options to control how a feature is generated.
///
/// - [feature]: the feature name in snake/lower case (e.g. "profile").
/// - [customPath]: optional absolute/relative base path to generate into.
///   If null, falls back to [TeutonConfig.featuresPath].
/// - [template]: template name to use (e.g. 'default' | 'minimal').
///   If null, falls back to [TeutonConfig.defaultTemplate].
/// - [dryRun]: when true, prints actions but does not write files.
/// - [verbose]: when true, prints detailed progress messages.
class CreateOptions {
  final String feature;
  final String? customPath; // Overrides config.featuresPath when provided
  final String? template; // 'default' | 'minimal'
  final bool dryRun;
  final bool verbose;

  const CreateOptions({
    required this.feature,
    this.customPath,
    this.template,
    this.dryRun = false,
    this.verbose = false,
  });
}

class FeatureGenerator {
  FeatureGenerator({TeutonConfig? config})
      : _config = config ?? TeutonConfig.load();

  final TeutonConfig _config;

  /// Generates a feature using the provided [options].
  ///
  /// The target directory is computed from [CreateOptions.customPath] if
  /// present; otherwise, from [TeutonConfig.featuresPath].
  ///
  /// Throws no exceptions on normal operation; any IO errors are surfaced by
  /// [dart:io] file operations.
  void generate(CreateOptions options) {
    final feature = options.feature.toLowerCase();
    final baseRoot = options.customPath ?? _config.featuresPath;
    final basePath = p.join(baseRoot, feature);
    final selectedTemplate = options.template ?? _config.defaultTemplate;

    if (options.verbose) {
      printInfo('Using template: ${green(selectedTemplate)}');
      printInfo('Target path: ${green(basePath)}');
    }

    final files = switch (selectedTemplate) {
      'minimal' => minimalTemplateFiles(feature),
      _ => defaultTemplateFiles(feature),
    };

    // Ensure directories exist
    final dirs =
        files.keys.map((rel) => p.dirname(p.join(basePath, rel))).toSet();

    for (final dir in dirs) {
      if (!options.dryRun) {
        Directory(dir).createSync(recursive: true);
      }
      if (options.verbose) printInfo('Ensured dir: ${green(dir)}');
    }

    // Write files
    var createdCount = 0;
    files.forEach((rel, content) {
      final filePath = p.join(basePath, rel);
      if (!options.dryRun) {
        File(filePath).writeAsStringSync(content);
      }
      createdCount++;
      if (options.verbose) printSuccess('Wrote $rel');
    });

    printSuccess(
        'Feature "$feature" ${options.dryRun ? 'simulated at' : 'created at'} $basePath ($createdCount files)');
  }
}
