/// Public API exports for programmatic usage of teuton_feature.
///
/// This allows importing:
///   import 'package:teuton_feature/teuton_feature.dart';
///
/// And then using [FeatureGenerator], [CreateOptions], [TeutonConfig], etc.
library;

export 'src/config.dart' show TeutonConfig;
export 'src/feature_generator.dart' show FeatureGenerator, CreateOptions;
export 'src/templates/templates.dart'
    show TemplateInfo, availableTemplates, toPascalCase;
