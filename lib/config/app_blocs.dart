import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders_system/core/services/injection_container.dart';
import 'package:orders_system/features/localization/presentation/cubit/localization_cubit.dart';

class AppBlocs {
  static final blockProviders = [
    BlocProvider<LocalizationCubit>.value(
      value: injector<LocalizationCubit>()..getSavedLang(),
    ),
  ];
}
