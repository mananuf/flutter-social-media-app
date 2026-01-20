class FeedItem {
  final String id;
  final String title;
  final String subtitle;
  final String iconAsset; // Or IconData
  final String category;

  FeedItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.iconAsset,
    required this.category,
  });
}