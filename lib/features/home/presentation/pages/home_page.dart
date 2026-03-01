import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/coffee.dart';
import '../../data/repositories/coffee_repository.dart';
import '../widgets/home_header.dart';
import '../widgets/promo_banner.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_selector.dart';
import '../widgets/coffee_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    'All Coffee',
    'Machiato',
    'Latte',
    'Americano',
  ];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // Android: iconos blancos
        statusBarBrightness: Brightness.dark, // iOS: iconos blancos
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Dark Header Section
                  const HomeHeader(),

                  // Search Bar (overlaying inside the header)
                  const Positioned(
                    top: 160, // Rough estimate based on safe area
                    left: 30,
                    right: 30,
                    child: SearchBarWidget(),
                  ),
                  const Positioned(
                    top: 240, // Rough estimate based on safe area
                    left: 0,
                    right: 0,
                    child: PromoBanner(),
                  ),
                ],
              ),

              const SizedBox(height: 80),

              CategorySelector(
                categories: categories,
                selectedIndex: _selectedCategoryIndex,
                onCategorySelected: (index) {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
              ),

              const SizedBox(height: 24),

              // Coffee Grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: FutureBuilder<List<Coffee>>(
                  future: CoffeeRepository().getCoffees(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No coffee found.'));
                    }

                    // Filter by selected category
                    final allCoffees = snapshot.data!;
                    final selectedCategory = categories[_selectedCategoryIndex];

                    final filteredCoffees =
                        selectedCategory == 'All Coffee'
                            ? allCoffees
                            : allCoffees
                                .where((c) => c.categoria == selectedCategory)
                                .toList();

                    if (filteredCoffees.isEmpty) {
                      return const Center(
                        child: Text('No coffee in this category.'),
                      );
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.72, // Adjust for card height
                          ),
                      itemCount: filteredCoffees.length,
                      itemBuilder: (context, index) {
                        final coffee = filteredCoffees[index];
                        return CoffeeCard(
                          imageUrl: coffee.imagen,
                          title: coffee.nombre,
                          subtitle: coffee.tipo,
                          price: coffee.precio,
                          rating: coffee.rating,
                          onTap: () {
                            context.push('/detail', extra: coffee);
                          },
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 30), // Bottom padding
            ],
          ),
        ),
      ), // AnnotatedRegion
    );
  }
}
