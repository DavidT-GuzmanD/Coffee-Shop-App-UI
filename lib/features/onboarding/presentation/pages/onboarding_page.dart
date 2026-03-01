import 'package:flutter/material.dart';
import '../widgets/onboarding_content.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: OnboardingContent(),
    );
  }
}
