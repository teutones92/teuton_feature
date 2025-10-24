import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'package:teuton_feature/src/feature_generator.dart';

void main() {
  group('FeatureGenerator', () {
    late Directory tempDir;

    setUp(() {
      tempDir = Directory.systemTemp.createTempSync('teuton_feature_test_');
    });

    tearDown(() {
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    test('generates minimal template in custom path (dry-run false)', () {
      final feature = 'sample';
      final base = p.join(tempDir.path, 'lib', 'features');
      final gen = FeatureGenerator();

      gen.generate(CreateOptions(
        feature: feature,
        customPath: base,
        template: 'minimal',
        dryRun: false,
        verbose: false,
      ));

      final expected = [
        p.join(base, feature, 'domain', 'entities', '${feature}_entity.dart'),
        p.join(base, feature, 'presentation', 'cubit', '${feature}_state.dart'),
        p.join(base, feature, 'presentation', 'cubit', '${feature}_cubit.dart'),
      ];
      for (final f in expected) {
        expect(File(f).existsSync(), true, reason: 'File not found: $f');
      }
    });

    test('dry-run does not write files', () {
      final feature = 'ghost';
      final base = p.join(tempDir.path, 'lib', 'features');
      final gen = FeatureGenerator();

      gen.generate(CreateOptions(
        feature: feature,
        customPath: base,
        template: 'default',
        dryRun: true,
        verbose: true,
      ));

      expect(Directory(p.join(base, feature)).existsSync(), false);
    });
  });
}
