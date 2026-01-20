import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:view_social/core/constants/colors.dart';
import 'package:view_social/presentation/pages/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VColors().black,
      body: Stack(
        children: [
          Center(
            child: LottieBuilder.asset(
              'assets/lotties/view-social.json',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Version 1.0',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                  fontSize: 15.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
