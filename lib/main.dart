import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orders_system/config/app_blocs.dart';
import 'package:orders_system/config/app_theme.dart';
import 'package:orders_system/config/locale/app_localizations_setup.dart';
import 'package:orders_system/core/services/initializer.dart';
import 'package:orders_system/core/utils/app_strings.dart';
import 'package:orders_system/features/localization/presentation/cubit/localization_cubit.dart';

Future<void> main() async {
  await Initializer.mainInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: AppBlocs.blockProviders,
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              locale: state.locale,
              title: AppStrings.title,
              theme: appTheme(),
              home: Container(),
            );
          },
        ),
      ),
    );
  }
}
