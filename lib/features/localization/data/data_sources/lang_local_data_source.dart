import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocalDataSource {
  Future<(bool?, String?)> changeLang({required String langCode});
  Future<(String?, String?)> getSavedLang();
}

class LangLocalDataSourceImpl implements LangLocalDataSource {
  final SharedPreferences sharedPreferences;
  LangLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<(bool?, String?)> changeLang({required String langCode}) async {
    try {
      final isChanged = await sharedPreferences.setString('locale', langCode);
      return (isChanged, null);
    } catch (e) {
      return (null, 'Error while change language');
    }
  }

  @override
  Future<(String?, String?)> getSavedLang() async {
    try {
      final lang = sharedPreferences.containsKey('locale')
          ? sharedPreferences.getString('locale')!
          : 'ar';
      return (lang, null);
    } catch (e) {
      return (null, 'Error while get saved language');
    }
  }
}
