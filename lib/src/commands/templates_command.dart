// ignore_for_file: avoid_print

import '../config.dart';
import '../templates/templates.dart';
import 'utils.dart';

class TemplatesCommand {
  void run(List<String> params) {
    final cfg = TeutonConfig.load();
    printInfo('Available templates (default: ${cfg.defaultTemplate}):');
    for (final t in availableTemplates) {
      final isDefault = t.name == cfg.defaultTemplate ? ' (default)' : '';
      print('  - ${green(t.name)}: ${t.description}$isDefault');
    }
  }
}
