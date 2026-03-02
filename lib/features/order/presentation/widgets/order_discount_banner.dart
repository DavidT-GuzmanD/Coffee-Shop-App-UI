import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class OrderDiscountBanner extends StatelessWidget {
  const OrderDiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.lightGray.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Icon(Icons.discount_outlined, color: AppColors.primary, size: 22),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              '1 Discount is Applied',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textSecondary,
            size: 22,
          ),
        ],
      ),
    );
  }
}
