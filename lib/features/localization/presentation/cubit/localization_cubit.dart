import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:orders_system/core/services/injection_container.dart';
import 'package:orders_system/core/use_cases/use_case.dart';
import 'package:orders_system/features/localization/data/use_cases/lang_use_case.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit()
      : super(
          const ChangeLocaleState(
            locale: Locale('ar'),
          ),
        );
  String currentLangCode = 'ar';
  Future<void> getSavedLang() async {
    try {
      final (response, err) =
          await injector<GetSavedLangUseCase>().call(NoParams());
      if (err != null) {
        throw Exception(err.toString());
      }
      currentLangCode = response!;
      emit(
        ChangeLocaleState(
          locale: Locale(currentLangCode),
        ),
      );
    } catch (e) {
      log('Localization ${e.toString()}');
    }
  }

  Future<void> _changeLang(String langCode) async {
    try {
      final (_, err) = await injector<ChangeLanguageUseCase>().call(
        LangParams(langCode: langCode),
      );
      if (err != null) {
        throw Exception(err.toString());
      }
      currentLangCode = langCode;
      emit(
        ChangeLocaleState(
          locale: Locale(currentLangCode),
        ),
      );
    } catch (e) {
      log('Localization ${e.toString()}');
    }
  }

  void toEnglish() => _changeLang('en');
  void toArabic() => _changeLang('ar');
}
