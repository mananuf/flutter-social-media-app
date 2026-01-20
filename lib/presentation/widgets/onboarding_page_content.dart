// presentation/widgets/onboarding_page_content.dart
import 'package:flutter/material.dart';
import 'package:view_social/domain/entities/onboarding_content.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingContent content;
  
  const OnboardingPageContent({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            content.imagePath,
            height: 400,
            width: double.infinity,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 400,
                color: Colors.grey[200],
                child: const Center(
                  child: Icon(Icons.image, size: 100, color: Colors.grey),
                ),
              );
            },
          ),
          const SizedBox(height: 50),
          Text(
            content.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          Text(
            content.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}