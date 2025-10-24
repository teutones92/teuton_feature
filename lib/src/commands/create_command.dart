import 'dart:io';
import 'utils.dart';
import '../feature_generator.dart';

class CreateCommand {
  void run(List<String> params) {
    if (params.isEmpty) {
      printError('Debes especificar el nombre de la feature.');
      return;
    }

    final feature = params.first.toLowerCase();
    final path = 'lib/features/$feature';
    final dir = Directory(path);

    if (dir.existsSync()) {
      printWarn('La feature "$feature" ya existe.');
      return;
    }

    printInfo('Creando feature "$feature"...');
    FeatureGenerator().generate(feature);
  }
}
