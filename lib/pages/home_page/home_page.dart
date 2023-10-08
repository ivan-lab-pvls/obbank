import 'dart:async';
import 'dart:convert';

import 'package:bank/app_theme.dart';
import 'package:bank/build_context_ext.dart';
import 'package:bank/constants.dart';
import 'package:bank/models/income.dart';
import 'package:bank/pages/home_page/widgets/news_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SharedPreferences _sharedPrefs;
  late StreamController<bool> _stream;
  var _balance = 0;

  @override
  void initState() {
    super.initState();
    _sharedPrefs = context.read<SharedPreferences>();
    _stream = context.read<StreamController<bool>>();
    _stream.stream.listen((event) {
      setState(() {
        _updateBalance();
      });
    });

    _updateBalance();
  }

  void _updateBalance() {
    _balance = 0;
    final cachedIncomes = _sharedPrefs.getString(Constants.incomesKey) ?? '';
    if (cachedIncomes.isNotEmpty) {
      final decoded = jsonDecode(cachedIncomes) as List<dynamic>;

      final incomes = decoded.map((e) => Income.fromJson(e)).toList();
      for (var income in incomes) {
        final amount = income.amount;
        _balance += amount;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Home',
                  style: context.textTheme.displayLarge,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/card_background.png'),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 42),
                    Text(
                      'Balance',
                      style: context.textTheme.labelMedium
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '\$$_balance',
                      style: GoogleFonts.unbounded(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '5213 5478 6545 0231',
                      style: GoogleFonts.unbounded(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'News',
                        style: GoogleFonts.unbounded(
                          color: AppTheme.blackFontColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Text(
                      'View all',
                      style: GoogleFonts.unbounded(
                        color: context.theme.primaryColor,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList.builder(
                itemCount: Constants.news.length,
                itemBuilder: (context, index) {
                  final newsItem = Constants.news[index];
                  return NewsItemWidget(newsItem: newsItem);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
