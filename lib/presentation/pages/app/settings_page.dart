import 'package:flutter/material.dart';
import 'package:view_social/domain/entities/setting_option.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final List<SettingOption> options = [
      SettingOption(title: "Account Information", subtitle: "Change your Account information", icon: Icons.person),
      SettingOption(title: "Password", subtitle: "Change your Password", icon: Icons.visibility),
      SettingOption(title: "Payment Methods", subtitle: "Add Your Credit / Credit Cards", icon: Icons.payment),
      SettingOption(title: "Invite Your Friends", subtitle: "Get \$3 For Each Invitation!", icon: Icons.edit),
      SettingOption(title: "Theme Colour", subtitle: "Change Your Theme Colour", icon: Icons.settings),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
               // Header
               Row(
                children: [
                  GestureDetector(
                    onTap: (){}, // Assuming this is main tab, no back needed usually
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Settings",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2D2D3A)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // Balance the back button
                ],
               ),
               const SizedBox(height: 40),

               // List
               Expanded(
                 child: ListView.separated(
                   itemCount: options.length,
                   separatorBuilder: (_, __) => const SizedBox(height: 30),
                   itemBuilder: (context, index) {
                     final option = options[index];
                     return Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Icon(option.icon, size: 28, color: const Color(0xFF1D1D1D)),
                         const SizedBox(width: 20),
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 option.title,
                                 style: const TextStyle(
                                   fontSize: 18, 
                                   fontWeight: FontWeight.bold,
                                   color: Color(0xFF2D2D3A),
                                 ),
                               ),
                               const SizedBox(height: 6),
                               Text(
                                 option.subtitle,
                                 style: TextStyle(
                                   fontSize: 14, 
                                   color: Colors.grey.shade500,
                                 ),
                               ),
                             ],
                           ),
                         )
                       ],
                     );
                   },
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }
}