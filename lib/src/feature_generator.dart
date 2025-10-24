import 'dart:io';
import 'commands/utils.dart';

class FeatureGenerator {
  void generate(String feature) {
    final featurePascal = _toPascalCase(feature);
    final basePath = 'lib/features/$feature';

    final dirs = [
      'data/models',
      'data/repositories',
      'domain/entities',
      'domain/repositories',
      'domain/usecases',
      'presentation/cubit',
      'presentation/pages',
    ];

    for (var d in dirs) {
      Directory('$basePath/$d').createSync(recursive: true);
    }

    File('$basePath/domain/entities/${feature}_entity.dart').writeAsStringSync(
      'class ${featurePascal}Entity { const ${featurePascal}Entity(); }',
    );
    printSuccess('Feature "$feature" creada en $basePath');
  }

  String _toPascalCase(String text) =>
      text.split('_').map((w) => w[0].toUpperCase() + w.substring(1)).join();
}
