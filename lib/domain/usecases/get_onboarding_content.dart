import 'package:view_social/domain/entities/onboarding_content.dart';

class GetOnboardingContentsUseCase {
  List<OnboardingContent> execute() {
    return [
      OnboardingContent(
        title: "Welcome to VIEW social",
        description: "Your intelligent chat assistant",
        imagePath: "assets/images/onboarding_image_one.png",
      ),
      OnboardingContent(
        title: "Chat with your favourite peeps",
        description: "Your intelligent chat assistant",
        imagePath: "assets/images/onboarding_image_two.png",
      ),
      OnboardingContent(
        title: "Unlock the power of VIEW",
        description: "Your intelligent chat assistant",
        imagePath: "assets/images/onboarding_image_three.png",
      ),
    ];
  }
}
