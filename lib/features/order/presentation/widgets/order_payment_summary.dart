import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class OrderPaymentSummary extends StatelessWidget {
  final double price;
  final int quantity;

  const OrderPaymentSummary({
    super.key,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final double total = (price * quantity);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(thickness: 0.5),
        const Text(
          'Payment Summary',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        _SummaryRow(label: 'Total', value: '\$ ${(total).toStringAsFixed(2)}'),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
