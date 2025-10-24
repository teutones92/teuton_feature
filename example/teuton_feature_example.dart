// A minimal programmatic example for teuton_feature.
// Run with:
//   dart run example/teuton_feature_example.dart

import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:teuton_feature/src/commands/utils.dart';
import 'package:teuton_feature/teuton_feature.dart';

void main() {
  // Create a temporary sandbox so the example doesn't touch your project.
  final tmp = Directory.systemTemp.createTempSync('teuton_feature_example_');
  final base = p.join(tmp.path, 'lib', 'features');

  // Configure to use the temporary base path and the minimal template
  // (pure Dart, no Flutter dependency required).
  final cfg = TeutonConfig(
    featuresPath: base,
    defaultTemplate: 'minimal',
  );

  printInfo('Sandbox: ${tmp.path}');

  // Generate a feature programmatically.
  final generator = FeatureGenerator(config: cfg);
  generator.generate(const CreateOptions(
    feature: 'profile',
    template: 'minimal',
    dryRun: false,
    verbose: true,
    // customPath is optional here because we configured featuresPath in cfg.
  ));

  // Show generated files.
  final featureDir = Directory(cfg.featurePath('profile'));
  if (featureDir.existsSync()) {
    printInfo('\nGenerated files:');
    for (final entry in featureDir.listSync(recursive: true)) {
      if (entry is File) {
        printInfo(' - ${p.relative(entry.path, from: tmp.path)}');
      }
    }
  }

  printSuccess('\nDone. You can inspect the sandbox above.');
}
