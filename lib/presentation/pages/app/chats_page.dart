import 'package:flutter/material.dart';
import 'package:view_social/domain/entities/chat_user.dart'; // Import your entity
import 'package:view_social/presentation/pages/app/single_chat_page.dart';
import 'package:view_social/presentation/widgets/custom_search_bar.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final List<ChatUser> chats = [
      ChatUser(
        id: '1',
        name: 'Avicii Ronaldo',
        message: 'Heyo',
        time: '5:15',
        avatarUrl: '',
      ),
      ChatUser(
        id: '2',
        name: 'Netia Horaan',
        message: 'Heyo',
        time: '5:15',
        avatarUrl: '',
      ),
      ChatUser(
        id: '3',
        name: 'Segam Holland',
        message: 'Heyo',
        time: '5:15',
        avatarUrl: '',
      ),
      ChatUser(
        id: '4',
        name: 'Natia Horaan',
        message: 'Heyo',
        time: '5:15',
        avatarUrl: '',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Messages",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D3A),
                ),
              ),
              const SizedBox(height: 20),
              const CustomSearchBar(hintText: "Search chats..."),
              const SizedBox(height: 20),

              Expanded(
                child: ListView.separated(
                  itemCount: chats.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SingleChatPage(userName: chat.name),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Avatar Placeholder
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.grey.shade200,
                              // Replace with NetworkImage(chat.avatarUrl)
                              child: Icon(
                                Icons.person,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chat.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF2D2D3A),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.done_all,
                                        size: 16,
                                        color: Colors.grey.shade400,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        chat.message,
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              chat.time,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
