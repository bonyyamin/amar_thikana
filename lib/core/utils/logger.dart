import 'package:logging/logging.dart';

void setupLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // In development, print to console
    print('${record.level.name}: ${record.time}: ${record.message}');

    // In production, you might want to use a proper logging service
    // or write to a file instead of using print
  });
}
