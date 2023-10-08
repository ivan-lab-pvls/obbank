import 'dart:async';
import 'dart:convert';

import 'package:bank/app_theme.dart';
import 'package:bank/build_context_ext.dart';
import 'package:bank/constants.dart';
import 'package:bank/models/income.dart';
import 'package:bank/router.dart';
import 'package:bank/widgets_global/red_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
export 'add_income_page.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  late final SharedPreferences _sharedPrefs;
  late final StreamController<bool> _stream;
  List<Income> _incomes = [];

  @override
  void initState() {
    super.initState();
    _sharedPrefs = context.read<SharedPreferences>();
    _stream = context.read<StreamController<bool>>();
    init();
  }

  Future<void> init() async {
    final cachedIncomes = _sharedPrefs.getString(Constants.incomesKey) ?? '';
    if (cachedIncomes.isNotEmpty) {
      final decoded = jsonDecode(cachedIncomes) as List<dynamic>;
      setState(() {
        _incomes = decoded.map((e) => Income.fromJson(e)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  bottom: 32,
                ),
                child: Text(
                  'Income',
                  style: context.textTheme.displayLarge,
                ),
              ),
            ),
            _incomes.isEmpty
                ? SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'No information on income yet',
                              textAlign: TextAlign.center,
                              style: context.textTheme.displayLarge,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Click on the "Add income" button',
                              textAlign: TextAlign.center,
                              style: context.textTheme.titleSmall,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: RedButton(
                            title: 'Add income',
                            onTap: () => _onAddIcomeTap(context),
                          ),
                        ),
                      ],
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    sliver: SliverList.builder(
                      itemCount: _incomes.length,
                      itemBuilder: (context, index) {
                        final income = _incomes[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (_) => _deleteIncome(index),
                                  backgroundColor: context.theme.primaryColor,
                                  icon: FontAwesomeIcons.trash,
                                ),
                              ],
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppTheme.greyFontColor2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${income.amount}\$',
                                    style:
                                        context.textTheme.labelSmall?.copyWith(
                                      color: AppTheme.blackFontColor,
                                    ),
                                  ),
                                  if (income.description.isNotEmpty) ...[
                                    const SizedBox(height: 10),
                                    Text(
                                      income.description,
                                      style: context.textTheme.titleMedium,
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: _incomes.isNotEmpty
          ? FloatingActionButton(
              backgroundColor: context.theme.primaryColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => _onAddIcomeTap(context),
            )
          : null,
    );
  }

  void _onAddIcomeTap(BuildContext context) async {
    final newIncome = await context.pushNamed<Income>(Routes.addIncome);
    if (newIncome == null) {
      return;
    }
    _addIncome(newIncome);
  }

  Future<void> _addIncome(Income income) async {
    setState(() {
      _incomes.add(income);
    });

    final incomesToCache = _incomes.map((e) => e.toJson()).toList();

    await _sharedPrefs.setString(
      Constants.incomesKey,
      jsonEncode(incomesToCache),
    );
    _stream.sink.add(true);
  }

  Future<void> _deleteIncome(int index) async {
    setState(() {
      _incomes.removeAt(index);
    });

    final incomesToCache = _incomes.map((e) => e.toJson()).toList();

    await _sharedPrefs.setString(
      Constants.incomesKey,
      jsonEncode(incomesToCache),
    );
    _stream.sink.add(true);
  }
}
