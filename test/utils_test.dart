import 'dart:async';

import 'package:test/test.dart';
import 'package:teuton_feature/src/commands/utils.dart';

void main() {
  group('utils', () {
    test('printHelp contains CLI title', () async {
      final buffer = StringBuffer();
      await runZonedGuarded(
          () async {
            printHelp();
          },
          (e, st) {},
          zoneSpecification: ZoneSpecification(
            print: (self, parent, zone, line) {
              buffer.writeln(line);
            },
          ));

      expect(buffer.toString(), contains('Teuton Feature CLI'));
      expect(buffer.toString(), contains('Available commands:'));
    });

    test('ansi color pens include original text', () {
      final s1 = green('hello');
      final s2 = red('error');
      final s3 = blue('info');
      final s4 = yellow('warn');

      expect(s1, contains('hello'));
      expect(s2, contains('error'));
      expect(s3, contains('info'));
      expect(s4, contains('warn'));
    });
  });
}
