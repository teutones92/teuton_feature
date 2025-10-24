import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

/// Configuration model for the Teuton Feature generator.
///
/// Values can be provided manually or loaded from a `teuton_config.yaml` at
/// the project root via [TeutonConfig.load].
class TeutonConfig {
  /// Creates a config with optional overrides.
  TeutonConfig({
    String? featuresPath,
    String? defaultTemplate,
    this.author,
    this.organization,
    this.templates = const ['default', 'minimal'],
  })  : featuresPath = featuresPath ?? 'lib/features',
        defaultTemplate = defaultTemplate ?? 'default';

  /// Base path where all features will be generated (e.g. `lib/features`).
  final String featuresPath;

  /// Default template name used when none is specified (e.g. `default`).
  final String defaultTemplate;

  /// Optional author metadata for templates.
  final String? author;

  /// Optional organization/package ID for templates.
  final String? organization;

  /// List of template names available to the generator.
  final List<String> templates;

  /// Returns the full path to a given [feature] directory under
  /// [featuresPath].
  String featurePath(String feature) => p.join(featuresPath, feature);

  TeutonConfig copyWith({
    String? featuresPath,
    String? defaultTemplate,
    String? author,
    String? organization,
    List<String>? templates,
  }) {
    return TeutonConfig(
      featuresPath: featuresPath ?? this.featuresPath,
      defaultTemplate: defaultTemplate ?? this.defaultTemplate,
      author: author ?? this.author,
      organization: organization ?? this.organization,
      templates: templates ?? this.templates,
    );
  }

  /// Loads configuration from a `teuton_config.yaml` file at [fromDir] (or the
  /// current directory when omitted). Invalid or missing files fall back to
  /// sensible defaults.
  static TeutonConfig load({String? fromDir}) {
    final root = fromDir ?? Directory.current.path;
    final file = File(p.join(root, 'teuton_config.yaml'));
    if (!file.existsSync()) {
      return TeutonConfig();
    }

    try {
      final yaml = loadYaml(file.readAsStringSync());
      if (yaml is! YamlMap) return TeutonConfig();

      String? s(Object? v) => v is String ? v : null;
      List<String>? list(Object? v) =>
          v is YamlList ? v.whereType<String>().toList(growable: false) : null;

      return TeutonConfig(
        featuresPath: s(yaml['features_path']) ?? 'lib/features',
        defaultTemplate:
            s(yaml['default_template']) ?? s(yaml['template']) ?? 'default',
        author: s(yaml['author']),
        organization: s(yaml['organization']),
        templates: list(yaml['templates']) ?? const ['default', 'minimal'],
      );
    } catch (_) {
      // On parse errors, fallback to defaults.
      return TeutonConfig();
    }
  }
}
