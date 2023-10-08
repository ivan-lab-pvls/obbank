import 'package:bank/models/news_item.dart';
import 'package:bank/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String start = '/start';
  static const String init = '/init';

  static const String home = '/home';

  static const String income = '/income';
  static const String addIncome = '/addIncome';

  static const String news = '/news';
  static const String newsItem = '/newsItem';

  static const String settings = '/settings';
  static const String net = '/net';

  static GoRouter get router => GoRouter(
        initialLocation: init,
        routes: [
          GoRoute(
            path: init,
            pageBuilder: (context, state) => const MaterialPage(
              child: InitPage(),
            ),
          ),
          GoRoute(
            name: start,
            path: start,
            pageBuilder: (context, state) => const MaterialPage(
              child: StartPage(),
            ),
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                MainPage(child: navigationShell),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: home,
                    path: home,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: HomePage(),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: income,
                    path: income,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: IncomePage(),
                    ),
                  ),
                  GoRoute(
                    name: addIncome,
                    path: addIncome,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: AddIncomePage(),
                    ),
                  )
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: news,
                    path: news,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: NewsPage(),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: settings,
                    path: settings,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: SettingsPage(),
                    ),
                  ),
                  GoRoute(
                    name: net,
                    path: net,
                    pageBuilder: (context, state) => MaterialPage(
                      child: NetScreen(
                        u: state.extra as String,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: newsItem,
            path: newsItem,
            pageBuilder: (context, state) => MaterialPage(
              child: NewsItemPage(
                newsItem: state.extra as NewsItem,
              ),
            ),
          ),
        ],
      );
}
