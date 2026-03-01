import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/coffee.dart';

class DetailInfo extends StatelessWidget {
  final Coffee coffee;

  const DetailInfo({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coffee.nombre,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              coffee.tipo,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Icon(IconlyBold.star, color: Colors.amber, size: 22),
                const SizedBox(width: 4),
                Text(
                  coffee.rating.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '(${coffee.reviewCount})',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Offset to align icons with the "tipo" text row
            const SizedBox(height: 34),
            Row(
              children: const [
                _FeatureIcon(icon: Icons.two_wheeler_rounded),
                SizedBox(width: 12),
                _FeatureIcon(icon: Icons.coffee),
                SizedBox(width: 12),
                _FeatureIcon(icon: Icons.local_drink_rounded),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _FeatureIcon extends StatelessWidget {
  final IconData icon;

  const _FeatureIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.textSecondary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: AppColors.primary, size: 20),
    );
  }
}
