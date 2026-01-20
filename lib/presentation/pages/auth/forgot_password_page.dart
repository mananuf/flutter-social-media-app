import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

enum ResetOption { email, phone }

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // Track the selected option. Default to Email.
  ResetOption _selectedOption = ResetOption.email;

  @override
  Widget build(BuildContext context) {
    // Using the same light grey background from the previous screen
    final backgroundColor = const Color(0xFFF8F9FD);
    final darkTextColor = const Color(0xFF2D2D3A);
    final greyTextColor = Colors.grey.shade600;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Back Button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 20),
                ),
              ),
              const SizedBox(height: 40),
              
              // Title
              Text(
                "Forget Password",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: darkTextColor,
                ),
              ),
              const SizedBox(height: 12),
              
              // Subtitle
              Text(
                "Select which contact details should we use to reset your password",
                style: TextStyle(
                  fontSize: 16,
                  color: greyTextColor,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),

              // Email Option Card
              _buildOptionCard(
                option: ResetOption.email,
                icon: Icons.email_outlined,
                title: "Email",
                subtitle: "Code Send to your email",
                isSelected: _selectedOption == ResetOption.email,
                darkTextColor: darkTextColor,
                greyTextColor: greyTextColor,
              ),
              
              const SizedBox(height: 20),

              // Phone Option Card
              _buildOptionCard(
                option: ResetOption.phone,
                icon: Icons.phone_outlined,
                title: "Phone",
                // Note: Image shows "Code Send to your email" for phone too,
                // which is likely a typo in the design. Corrected here.
                subtitle: "Code Send to your phone", 
                isSelected: _selectedOption == ResetOption.phone,
                darkTextColor: darkTextColor,
                greyTextColor: greyTextColor,
              ),

              const Spacer(),

              // Next Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Next action based on _selectedOption
                    print("Proceeding with: ${_selectedOption.name}");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D1D1D), // Almost black
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build the selection cards
  Widget _buildOptionCard({
    required ResetOption option,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required Color darkTextColor,
    required Color greyTextColor,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = option;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            // Apply a thick black border if selected, otherwise no border
            color: isSelected ? const Color(0xFF1D1D1D) : Colors.transparent,
            width: 2.5,
          ),
          // Add a subtle shadow only if not selected to make it pop out a bit
          boxShadow: isSelected ? [] : [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon with a circular background
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF1D1D1D), size: 28),
            ),
            const SizedBox(width: 20),
            // Text content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkTextColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: greyTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}