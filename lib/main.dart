import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pro_mina/config/routes.dart';
import 'package:pro_mina/core/api/api_keys.dart';
import 'package:pro_mina/core/utils/cache_helper.dart';
import 'core/utils/my_observer.dart';
import 'app.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(
    MyApp(
      route: CacheHelper.getDate(ApiKeys.token) == null ||
              CacheHelper.getDate(ApiKeys.token) == ''
          ? Routes.login
          : Routes.home,
    ),
  );
}
