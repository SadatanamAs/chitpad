import 'package:logger/logger.dart';

/// App-wide logger. Use this instead of print().
/// In release builds, set level to Level.warning or Level.nothing.
final appLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 80,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
  level: const bool.fromEnvironment('dart.vm.product')
      ? Level.warning
      : Level.debug,
);
