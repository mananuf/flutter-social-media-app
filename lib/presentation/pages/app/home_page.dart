import 'package:flutter/material.dart';
import 'package:view_social/presentation/widgets/custom_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Explore",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2D2D3A)),
              ),
              const SizedBox(height: 20),
              const CustomSearchBar(hintText: "Search categories..."),
              const SizedBox(height: 20),
              
              // Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildChip("All", true),
                    _buildChip("Social", false),
                    _buildChip("Health", false),
                    _buildChip("Sports", false),
                    _buildChip("Music", false),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Grid Content
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.85,
                  children: [
                    _buildCard(Icons.tiktok, "TikTok", "Generate Tags", Colors.black),
                    _buildCard(Icons.telegram, "Telegram", "Popular Channels", Colors.blue),
                    _buildCard(Icons.health_and_safety, "Medicine", "Get Info", Colors.pink),
                    _buildCard(Icons.sports_basketball, "Sports", "Live Scores", Colors.orange),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1D1D1D) : Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String subtitle, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: iconColor),
          const SizedBox(height: 15),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(
            subtitle, 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500)
          ),
          const SizedBox(height: 15),
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey.shade100,
            child: const Icon(Icons.arrow_forward, size: 15, color: Colors.grey),
          )
        ],
      ),
    );
  }
}