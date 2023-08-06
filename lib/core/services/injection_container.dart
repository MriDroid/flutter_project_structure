import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:orders_system/core/api/api_consumer.dart';
import 'package:orders_system/core/api/api_interceptor.dart';
import 'package:orders_system/core/api/dio_consumer.dart';
import 'package:orders_system/features/localization/data/data_sources/lang_local_data_source.dart';
import 'package:orders_system/features/localization/data/use_cases/lang_use_case.dart';
import 'package:orders_system/features/localization/presentation/cubit/localization_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> injectionInit() async {
  // ******************* -BLoCs *******************
  injector.registerLazySingleton<LocalizationCubit>(
    () => LocalizationCubit(),
  );
  // ******************* -UseCases *******************
  injector.registerLazySingleton<ChangeLanguageUseCase>(
    () => ChangeLanguageUseCase(),
  );

  injector.registerLazySingleton<GetSavedLangUseCase>(
    () => GetSavedLangUseCase(),
  );
  // ******************* -DataSources *******************
  injector.registerLazySingleton<LangLocalDataSource>(
    () => LangLocalDataSourceImpl(
      sharedPreferences: injector<SharedPreferences>(),
    ),
  );
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
