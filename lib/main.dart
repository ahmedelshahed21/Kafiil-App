import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/core/utils/observer.dart';
import 'package:kafiil_app/core/utils/service_locator.dart';
import 'package:kafiil_app/kafiil_app/kafiil_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  runApp(const KafiilApp());
}

