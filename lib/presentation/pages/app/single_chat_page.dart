import 'package:flutter/material.dart';
import 'package:view_social/domain/entities/chat_message.dart';

class SingleChatPage extends StatefulWidget {
  final String userName; // Pass the name from the previous screen
  const SingleChatPage({super.key, required this.userName});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final List<ChatMessage> messages = [
    ChatMessage(
      text: "Hi, I just wanna know that how much time you'll be updated.",
      time: "10:52",
      type: MessageType.sender,
    ),
    ChatMessage(
      text: "Maybe, Nearly July, 2022",
      time: "10:53",
      type: MessageType.receiver,
    ),
    ChatMessage(
      text: "Okay, I'm Waiting....",
      time: "10:53",
      type: MessageType.sender,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (context, index) =>
                  _buildMessageBubble(messages[index]),
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 20,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      // Use the Row inside title
      title: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFF0F0F0),
            child: Icon(Icons.smart_toy_outlined, color: Colors.black),
          ),
          const SizedBox(width: 12),
          // FIX: Wrap the text container in Expanded to prevent overflow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Keep it compact
              children: [
                Text(
                  widget.userName,
                  maxLines: 1, // Stay on one line
                  overflow: TextOverflow.ellipsis, // Add '...'
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Online",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        _buildHeaderIcon(Icons.phone),
        _buildHeaderIcon(Icons.videocam),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 20),
        onPressed: () {},
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    bool isReceiver = message.type == MessageType.receiver;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: isReceiver
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isReceiver
                  ? const Color(0xFF1D1D1D)
                  : const Color(0xFFEEF0F5),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(isReceiver ? 0 : 20),
                bottomRight: Radius.circular(isReceiver ? 20 : 0),
              ),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: isReceiver ? Colors.white : Colors.black87,
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message.time,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 10),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1D1D1D),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.mic, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Write now...",
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.send, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
