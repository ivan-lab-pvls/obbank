import 'package:bank/app_theme.dart';
import 'package:bank/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _onBottomNavBarItemTap(int index) => widget.child.goBranch(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: widget.child.currentIndex,
        onItemTap: _onBottomNavBarItemTap,
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
  });

  final int currentIndex;
  final void Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => onItemTap(0),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    currentIndex == 0
                        ? 'assets/icons/bottom_bar/home_active.svg'
                        : 'assets/icons/bottom_bar/home_inactive.svg',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Home',
                    style: GoogleFonts.unbounded(
                      fontSize: 10,
                      color: currentIndex == 0
                          ? context.theme.primaryColor
                          : AppTheme.greyFontColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onItemTap(1),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    currentIndex == 1
                        ? 'assets/icons/bottom_bar/wallet_active.svg'
                        : 'assets/icons/bottom_bar/wallet_inactive.svg',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Income',
                    style: GoogleFonts.unbounded(
                      fontSize: 10,
                      color: currentIndex == 1
                          ? context.theme.primaryColor
                          : AppTheme.greyFontColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onItemTap(2),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    currentIndex == 2
                        ? 'assets/icons/bottom_bar/news_active.svg'
                        : 'assets/icons/bottom_bar/news_inactive.svg',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'News',
                    style: GoogleFonts.unbounded(
                      fontSize: 10,
                      color: currentIndex == 2
                          ? context.theme.primaryColor
                          : AppTheme.greyFontColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onItemTap(3),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    currentIndex == 3
                        ? 'assets/icons/bottom_bar/settings_active.svg'
                        : 'assets/icons/bottom_bar/settings_inactive.svg',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Settings',
                    style: GoogleFonts.unbounded(
                      fontSize: 10,
                      color: currentIndex == 3
                          ? context.theme.primaryColor
                          : AppTheme.greyFontColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
