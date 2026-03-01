import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:iconly/iconly.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.darkGray,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              style: TextStyle(color: AppColors.lightGray, fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Search coffee',
                hintStyle: TextStyle(color: AppColors.lightGray, fontSize: 16),
                prefixIcon: Icon(
                  IconlyLight.search,
                  color: AppColors.surface,
                  size: 20,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            IconlyLight.filter,
            color: AppColors.surface,
            size: 20,
          ),
        ),
      ],
    );
  }
}
