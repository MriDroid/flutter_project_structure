import 'package:equatable/equatable.dart';
import 'package:orders_system/core/services/injection_container.dart';
import 'package:orders_system/core/use_cases/use_case.dart';
import 'package:orders_system/features/localization/data/data_sources/lang_local_data_source.dart';

class ChangeLanguageUseCase implements UseCase<bool, LangParams> {
  @override
  Future<(bool?, String?)> call(LangParams params) =>
      injector<LangLocalDataSource>().changeLang(
        langCode: params.langCode,
      );
}

class GetSavedLangUseCase implements UseCase<String?, NoParams> {
  @override
  Future<(String?, String?)> call(NoParams params) =>
      injector<LangLocalDataSource>().getSavedLang();
}

class LangParams extends Equatable {
  final String langCode;

  const LangParams({required this.langCode});

  @override
  List<Object?> get props => [langCode];
}
