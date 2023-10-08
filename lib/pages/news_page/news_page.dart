import 'package:bank/build_context_ext.dart';
import 'package:bank/constants.dart';
import 'package:bank/pages/home_page/widgets/news_item_widget.dart';
import 'package:bank/pages/news_page/widgets/extra_new_card.dart';
import 'package:flutter/material.dart';
export 'news_item_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

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
                ),
                child: Text(
                  'News',
                  style: context.textTheme.displayLarge,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: ExtraNewCard(newsItem: Constants.extraNew),
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
