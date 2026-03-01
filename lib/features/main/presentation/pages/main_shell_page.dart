import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:iconly/iconly.dart';

class MainShellPage extends StatefulWidget {
  final Widget child;

  const MainShellPage({super.key, required this.child});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);

    // Switch between bottom nav routes
    switch (index) {
      case 0:
        // context.go('/home');
        break;
      case 1:
        // context.go('/favorites');
        break;
      case 2:
        // context.go('/cart');
        break;
      case 3:
        // context.go('/notifications');
        break;
    }
  }

  Widget _buildIcon(IconData icon, {bool isActive = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack, // Gives a nice little bounce
      transform: Matrix4.identity()..scale(isActive ? 1.15 : 1.0),
      transformAlignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(height: 6),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isActive ? 1.0 : 0.0,
            child: Container(
              width: 10,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        // We use Theme to remove the default splash/highlight ripple effect
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.surface,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.textSecondary,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(IconlyLight.home, isActive: false),
                activeIcon: _buildIcon(IconlyBold.home, isActive: true),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(IconlyLight.heart, isActive: false),
                activeIcon: _buildIcon(IconlyBold.heart, isActive: true),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(IconlyLight.bag, isActive: false),
                activeIcon: _buildIcon(IconlyBold.bag, isActive: true),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(IconlyLight.notification, isActive: false),
                activeIcon: _buildIcon(IconlyBold.notification, isActive: true),
                label: 'Notifications',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
