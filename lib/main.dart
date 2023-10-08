import 'dart:async';

import 'package:bank/app_theme.dart';
import 'package:bank/firebase_options.dart';
import 'package:bank/notification_service.dart';
import 'package:bank/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await NotificationServiceFb().activate();

  final sharedPrefs = await SharedPreferences.getInstance();
  final StreamController<bool> updateBalanceStream =
      StreamController<bool>.broadcast();
  runApp(MyApp(sharedPrefs, updateBalanceStream));
}

class MyApp extends StatefulWidget {
  const MyApp(this._sharedPrefs, this._stream, {super.key});

  final SharedPreferences _sharedPrefs;
  final StreamController<bool> _stream;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    widget._stream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: widget._stream,
      child: Provider.value(
        value: widget._sharedPrefs,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.theme,
          routerConfig: Routes.router,
        ),
      ),
    );
  }
}
