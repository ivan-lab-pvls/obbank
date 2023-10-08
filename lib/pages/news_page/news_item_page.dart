import 'package:bank/app_theme.dart';
import 'package:bank/build_context_ext.dart';
import 'package:bank/models/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsItemPage extends StatelessWidget {
  const NewsItemPage({
    super.key,
    required this.newsItem,
  });

  final NewsItem newsItem;

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
                  bottom: 36,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        radius: 16,
                        onTap: () => Navigator.of(context).pop(null),
                        child: const Icon(
                          Icons.chevron_left,
                          color: AppTheme.blackFontColor,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'All news',
                        style: context.textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsItem.title,
                      style: context.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          colorFilter: ColorFilter.mode(
                            AppTheme.greyFontColor2,
                            BlendMode.srcIn,
                          ),
                          width: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('dd MMM, yyyy').format(newsItem.date),
                          style: GoogleFonts.unbounded(
                            color: AppTheme.greyFontColor2,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Image.asset(
                      newsItem.imagePath,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      newsItem.subtitle,
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
