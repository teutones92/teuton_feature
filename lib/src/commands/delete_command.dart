import 'dart:io';
import 'utils.dart';

class DeleteCommand {
  void run(List<String> params) {
    if (params.isEmpty) {
      printError('Debes especificar la feature a eliminar.');
      return;
    }

    final feature = params.first.toLowerCase();
    final path = 'lib/features/$feature';
    final dir = Directory(path);

    if (!dir.existsSync()) {
      printError('No existe la feature "$feature".');
      return;
    }

    stdout.write('¿Estás seguro de eliminar "$feature"? (y/n): ');
    final confirm = stdin.readLineSync()?.toLowerCase();
    if (confirm == 'y') {
      dir.deleteSync(recursive: true);
      printSuccess('Feature "$feature" eliminada.');
    } else {
      printInfo('Operación cancelada.');
    }
  }
}
