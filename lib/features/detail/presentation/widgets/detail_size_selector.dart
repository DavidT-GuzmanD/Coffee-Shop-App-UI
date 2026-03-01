import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class DetailSizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSizeChanged;

  const DetailSizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children:
              sizes.map((size) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onSizeChanged(size),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color:
                            selectedSize == size
                                ? AppColors.primary.withValues(alpha: 0.1)
                                : AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              selectedSize == size
                                  ? AppColors.primary
                                  : AppColors.lightGray,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          size,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight:
                                selectedSize == size
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                            color:
                                selectedSize == size
                                    ? AppColors.primary
                                    : AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
