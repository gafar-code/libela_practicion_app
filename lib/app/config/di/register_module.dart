import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../core/network/dio_client.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  DioClient get dioClient => DioClient();

  @lazySingleton
  Logger get logger => Logger(
        printer: PrettyPrinter(methodCount: 0, printTime: true),
      );
}
