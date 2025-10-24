// ignore_for_file: avoid_print

import 'package:ansicolor/ansicolor.dart';

final green = AnsiPen()..green(bold: true);
final red = AnsiPen()..red(bold: true);
final blue = AnsiPen()..blue(bold: true);
final yellow = AnsiPen()..yellow(bold: true);

void printSuccess(String msg) => print(green('✅ $msg'));
void printError(String msg) => print(red('❌ $msg'));
void printInfo(String msg) => print(blue('ℹ️  $msg'));
void printWarn(String msg) => print(yellow('⚠️  $msg'));

void printHelp() {
  print('''
${blue('🧩 Teuton Feature CLI')}
Tool for generating Flutter features with Clean Architecture + Cubit + GetIt.

Available commands:
  ${green('create <name>')}   → Creates a new complete feature
  ${green('delete <name>')}   → Deletes an existing feature
  ${green('list')}            → Lists all created features
  ${green('templates')}       → Lists available templates
  ${green('--help')}          → Shows this help
  ${green('--version')}       → Shows CLI version

Example:
  teuton_feature create profile
''');
}
