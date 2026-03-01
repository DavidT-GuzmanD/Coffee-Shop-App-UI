import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class CategorySelector extends StatefulWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _keys = [];

  @override
  void initState() {
    super.initState();
    // Initialize a GlobalKey for each category
    _keys.addAll(
      List.generate(widget.categories.length, (index) => GlobalKey()),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index) {
    widget.onCategorySelected(index);

    final key = _keys[index];
    final context = key.currentContext;
    if (context != null) {
      // Find the render box of the selected item
      final RenderBox box = context.findRenderObject() as RenderBox;
      // Get its position relative to the viewport
      final double itemWidth = box.size.width;
      final double itemPosition = box.localToGlobal(Offset.zero).dx;

      // Calculate where it should be to be centered
      final double screenWidth = MediaQuery.of(this.context).size.width;
      final double scrollOffset =
          _scrollController.offset +
          itemPosition -
          (screenWidth / 2) +
          (itemWidth / 2);

      // Clamp the offset to prevent out-of-bounds scrolling
      final double clampedOffset = scrollOffset.clamp(
        _scrollController.position.minScrollExtent,
        _scrollController.position.maxScrollExtent,
      );

      _scrollController.animateTo(
        clampedOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final isSelected = widget.selectedIndex == index;
          return GestureDetector(
            onTap: () => _scrollToIndex(index),
            child: Container(
              key: _keys[index], // Attach key here
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  widget.categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.darkGray,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
