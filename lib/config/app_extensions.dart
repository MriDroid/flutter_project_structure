import 'package:flutter/material.dart';
import 'package:orders_system/config/locale/app_localizations.dart';

extension AppLocalizationExtension on BuildContext {
  String translate(String key) {
    return AppLocalizations.translate(this, key);
  }
}
