import 'package:teuton_feature/src/commands/create_command.dart';
import 'package:teuton_feature/src/commands/delete_command.dart';
import 'package:teuton_feature/src/commands/list_command.dart';
import 'package:teuton_feature/src/commands/utils.dart';

void main(List<String> args) {
  if (args.isEmpty || args.contains('--help')) {
    printHelp();
    return;
  }

  final command = args.first;
  final params = args.skip(1).toList();

  switch (command) {
    case 'create':
      CreateCommand().run(params);
      break;
    case 'delete':
      DeleteCommand().run(params);
      break;
    case 'list':
      ListCommand().run(params);
      break;
    default:
      printError('Command "$command" not recognized.');
      printHelp();
  }
}
