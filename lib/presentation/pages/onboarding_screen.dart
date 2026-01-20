// presentation/pages/onboarding/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:view_social/core/constants/colors.dart';
import 'package:view_social/domain/entities/onboarding_content.dart';
import 'package:view_social/domain/usecases/get_onboarding_content.dart';
import 'package:view_social/presentation/pages/auth/login_page.dart';
import 'package:view_social/presentation/widgets/onboarding_page_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  late final List<OnboardingContent> contents;
  int currentPage = 0;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    contents = GetOnboardingContentsUseCase().execute();
    _controller.addListener(_onPageChanged);
    _isInitialized = true;
  }

  void _onPageChanged() {
    if (!_controller.position.hasContentDimensions) return;

    final newPage = _controller.page?.round() ?? 0;
    if (newPage != currentPage) {
      setState(() {
        currentPage = newPage;
      });
    }
  }

  void _goToNextPage() {
    if (currentPage < contents.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _goToPreviousPage() {
    if (currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _completeOnboarding() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  @override
  void dispose() {
    _controller.removeListener(_onPageChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final isLastPage = currentPage == contents.length - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: contents.length,
            itemBuilder: (context, index) {
              return OnboardingPageContent(content: contents[index]);
            },
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            right: 16.0,
            child: TextButton(
              onPressed: _skipOnboarding,
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.36,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: contents.length,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 8,
                  activeDotColor: VColors().black,
                  dotColor: Colors.grey[300]!,
                ),
              ),
            ),
          ),

          // Navigation Buttons
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentPage > 0)
                  FilledButton(
                    onPressed: _goToPreviousPage,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.all(16),
                      ),
                      elevation: WidgetStateProperty.all(
                        8.0,
                      ), // Shadow elevation
                      shadowColor: WidgetStateProperty.all(
                        Colors.black.withOpacity(0.2),
                      ),
                      surfaceTintColor: WidgetStateProperty.all(
                        Colors.transparent,
                      ),
                      overlayColor: WidgetStateProperty.all(
                        Colors.black.withOpacity(0.3),
                      ),
                    ),
                    child: Icon(Icons.arrow_back, color: VColors().black),
                  )
                else
                  const SizedBox(
                    width: 48,
                  ), // Placeholder for consistent layout

                const SizedBox(width: 16),

                // // Skip Button (shown except on last page)
                // if (!isLastPage && currentPage < contents.length - 1)
                //   TextButton(
                //     onPressed: _skipOnboarding,
                //     child: Text(
                //       "Skip",
                //       style: TextStyle(
                //         color: Colors.grey[600],
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),

                // const SizedBox(width: 16),

                // Next/Get Started Button
                FilledButton(
                  onPressed: _goToNextPage,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      isLastPage ? VColors().black : Colors.white,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    ),
                    elevation: WidgetStateProperty.all(8.0), // Shadow elevation
                    shadowColor: WidgetStateProperty.all(
                      Colors.black.withOpacity(0.2),
                    ),
                    surfaceTintColor: WidgetStateProperty.all(
                      Colors.transparent,
                    ),
                    overlayColor: WidgetStateProperty.all(
                      Colors.black.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        isLastPage ? "Get Started" : "Next",
                        style: TextStyle(
                          color: isLastPage ? Colors.white : VColors().black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (!isLastPage) const SizedBox(width: 8),
                      if (!isLastPage)
                        Icon(
                          Icons.arrow_forward,
                          color: VColors().black,
                          size: 20,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
