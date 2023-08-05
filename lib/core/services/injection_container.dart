import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:orders_system/core/api/api_consumer.dart';
import 'package:orders_system/core/api/api_interceptor.dart';
import 'package:orders_system/core/api/dio_consumer.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> injectionInit() async {
  // ******************* -BLoCs *******************
  // ******************* -UseCases *******************
  // ******************* -DataSources *******************
  // ******************* -Core *******************
  injector.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      client: injector(),
    ),
  );
  // ******************* -Externals *******************
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(
    () => sharedPreferences,
  );
  injector.registerLazySingleton(
    () => Dio(),
  );
  injector.registerLazySingleton(
    () => AppInterceptors(),
  );
  injector.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
}
