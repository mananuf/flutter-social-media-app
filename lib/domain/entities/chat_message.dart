enum MessageType { sender, receiver }

class ChatMessage {
  final String text;
  final String time;
  final MessageType type;

  ChatMessage({
    required this.text, 
    required this.time, 
    required this.type,
  });
}