import 'dart:io';
import 'utils.dart';

class ListCommand {
  void run(List<String> params) {
    final dir = Directory('lib/features');
    if (!dir.existsSync()) {
      printError('The lib/features folder does not exist.');
      return;
    }

    final features = dir.listSync().whereType<Directory>();
    if (features.isEmpty) {
      printWarn('No features created.');
      return;
    }

    printInfo('Existing features:');
    for (var f in features) {
      print('  - ${green(f.path.split('/').last)}');
    }
  }
}
