import 'dart:async';
import 'package:bank/app_theme.dart';
import 'package:bank/constants.dart';
import 'package:bank/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  void initState() {
    super.initState();
    Constants.posters = sadasx(Constants.posters, Constants.off);
    Constants.data = sadasx(Constants.data, Constants.off);
    Constants.inf = sadasx(Constants.inf, Constants.off);
    Constants.k = sadasx(Constants.k, Constants.off);
    Constants.fl = sadasx(Constants.fl, Constants.off);
  }

  String sadasx(String input, int shift) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      int charCode = input.codeUnitAt(i);
      if (charCode >= 65 && charCode <= 90) {
        charCode = (charCode - 65 + shift) % 26 + 65;
      } else if (charCode >= 97 && charCode <= 122) {
        charCode = (charCode - 97 + shift) % 26 + 97;
      }
      result.writeCharCode(charCode);
    }
    return result.toString();
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
