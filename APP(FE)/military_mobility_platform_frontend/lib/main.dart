import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:military_mobility_platform_frontend/service/localstorage.dart';
import 'package:military_mobility_platform_frontend/widgets/app.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  await LocalStorage().fetch();
  await initializeDateFormatting('ko_KR', null);
  return runZonedGuarded(() async {
    runApp(const App());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
