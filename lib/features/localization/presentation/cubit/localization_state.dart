part of 'localization_cubit.dart';

abstract class LocalizationState extends Equatable {
  final Locale locale;
  const LocalizationState({required this.locale});

  @override
  List<Object> get props => [locale];
}

class ChangeLocaleState extends LocalizationState {
  const ChangeLocaleState({required super.locale});
}
