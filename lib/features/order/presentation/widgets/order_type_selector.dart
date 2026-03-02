import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class OrderTypeSelector extends StatelessWidget {
  final bool isDelivery;
  final ValueChanged<bool> onChanged;

  const OrderTypeSelector({
    super.key,
    required this.isDelivery,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          _Tab(
            label: 'Deliver',
            selected: isDelivery,
            onTap: () => onChanged(true),
          ),
          _Tab(
            label: 'Pick Up',
            selected: !isDelivery,
            onTap: () => onChanged(false),
          ),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _Tab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : AppColors.textSecondary,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
