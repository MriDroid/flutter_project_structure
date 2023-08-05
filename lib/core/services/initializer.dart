import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders_system/core/services/bloc_observer.dart';
import 'package:orders_system/core/services/injection_container.dart';

class Initializer {
  static Future<void> mainInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await injectionInit();
    Bloc.observer = MyBlocObserver();
  }
}
