import 'package:bank/app_theme.dart';
import 'package:bank/build_context_ext.dart';
import 'package:bank/models/news_item.dart';
import 'package:bank/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({super.key, required this.newsItem});
  final NewsItem newsItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.newsItem, extra: newsItem),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Image.asset(
              newsItem.imagePath,
              fit: BoxFit.fitWidth,
              width: 100,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(height: 4),
                  Text(
                    newsItem.title,
                    style: context.textTheme.displaySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    newsItem.subtitle,
                    style: context.textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
