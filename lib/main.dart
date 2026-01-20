import 'package:flutter/material.dart';
import 'package:view_social/presentation/pages/splash_screen.dart';

void main() {
  runApp(const ViewSocialApp());
}

class ViewSocialApp extends StatelessWidget {
  const ViewSocialApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIEW Social',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.white)),
      home: SplashScreen(),
    );
  }
}
