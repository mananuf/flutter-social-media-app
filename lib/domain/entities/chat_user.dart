class ChatUser {
  final String id;
  final String name;
  final String message;
  final String time;
  final String avatarUrl; // In a real app, this would be a URL
  final int unreadCount;

  ChatUser({
    required this.id,
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    this.unreadCount = 0,
  });
}