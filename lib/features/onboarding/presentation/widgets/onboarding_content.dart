import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image - Full Screen
        Positioned.fill(
          child: Container(
            color: Colors.black, // Ensure background behind the image is black
            child: Align(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                heightFactor:
                    0.66, // Make the image take up 66% of the screen height to scale it down slightly
                child: Image.asset(
                  'assets/6.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ),
        // Gradient Overlay - Smooth transition to black at bottom
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.2),
                  Colors.black.withValues(alpha: 0.8),
                  Colors.black,
                  Colors.black,
                ],
                stops: const [0.0, 0.45, 0.55, 0.65, 0.75, 1.0],
              ),
            ),
          ),
        ),
        // Content - Floating at bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 40.0),
            // Removed black background here to let the gradient do the work
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 350),
                  child: const Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.surface,
                      height: 1.5, // 150% line height
                      letterSpacing: 36 * 0.005, // 0.5% of font size
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                  ), // Approximate button width
                  child: const Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                      height: 1.5, // 150% line height
                      letterSpacing: 16 * 0.01, // 1% of font size
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                PrimaryButton(
                  text: 'Get Started',
                  onPressed: () {
                    // Action when user clicks Get Started
                    // Typically navs to home. Example: context.go('/home')
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Welcome to Coffee Shop!'),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20), // Bottom padding
              ],
            ),
          ),
        ),
      ],
    );
  }
}
