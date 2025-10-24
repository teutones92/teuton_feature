import 'package:teuton_feature/src/commands/create_command.dart';
import 'package:teuton_feature/src/commands/delete_command.dart';
import 'package:teuton_feature/src/commands/list_command.dart';
import 'package:teuton_feature/src/commands/templates_command.dart';
import 'package:teuton_feature/src/commands/utils.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    printHelp();
    return;
  }

  // Handle global flags like --help and --version (without subcommand)
  if (args.length == 1 && (args.first == '--help' || args.first == '-h')) {
    printHelp();
    return;
  }
  if (args.length == 1 && (args.first == '--version' || args.first == '-v')) {
    // Best-effort manual version: keep in sync with pubspec.yaml
    printInfo('teuton_feature version 1.2.3');
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
    case 'templates':
      TemplatesCommand().run(params);
      break;
    default:
      printError('Command "$command" not recognized.');
      printHelp();
  }
}
