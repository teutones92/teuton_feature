import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

class TeutonConfig {
  TeutonConfig({
    String? featuresPath,
    String? defaultTemplate,
    this.author,
    this.organization,
    this.templates = const ['default', 'minimal'],
  })  : featuresPath = featuresPath ?? 'lib/features',
        defaultTemplate = defaultTemplate ?? 'default';

  final String featuresPath;
  final String defaultTemplate;
  final String? author;
  final String? organization;
  final List<String> templates;

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
