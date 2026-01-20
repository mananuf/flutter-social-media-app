import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/onboarding_image_one.png', height: 400),
          SizedBox(height: 50),
          Text(
            "Welcome to BrainBox AI",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "Your intelligent chat assistant for smarter conversations",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
