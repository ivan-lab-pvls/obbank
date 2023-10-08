import 'package:bank/build_context_ext.dart';
import 'package:bank/constants.dart';
import 'package:bank/pages/settings_page/widgets/settings_tile.dart';
import 'package:bank/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
export 'net_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  bottom: 36,
                ),
                child: Text(
                  'Settings',
                  style: context.textTheme.displayLarge,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SettingsTile(
                    iconPath: 'assets/icons/settings/check_box.svg',
                    title: 'Privacy policy',
                    onTap: () => context.pushNamed(Routes.net,
                        extra: Constants.privacyPolicyUrl),
                  ),
                  SettingsTile(
                    iconPath: 'assets/icons/settings/message.svg',
                    title: 'Terms of use',
                    onTap: () => context.pushNamed(Routes.net,
                        extra: Constants.termsOfUseUrl),
                  ),
                  SettingsTile(
                    iconPath: 'assets/icons/settings/star.svg',
                    title: 'Rate app',
                    //TODO: Add your app's appStoreId
                    onTap: () => InAppReview.instance
                        .openStoreListing(appStoreId: '6468774780'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
