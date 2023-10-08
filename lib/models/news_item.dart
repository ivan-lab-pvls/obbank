class NewsItem {
  const NewsItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.date,
  });
  final String imagePath;
  final String title;
  final String subtitle;
  final DateTime date;
}
