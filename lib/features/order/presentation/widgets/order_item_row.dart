import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/coffee.dart';

class OrderItemRow extends StatelessWidget {
  final Coffee coffee;
  final String selectedSize;
  final ValueChanged<String> onSizeChanged;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const OrderItemRow({
    super.key,
    required this.coffee,
    required this.selectedSize,
    required this.onSizeChanged,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  void _showSizePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Select Size',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children:
                    coffee.tamanos.map((size) {
                      final bool isSelected = size == selectedSize;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            onSizeChanged(size);
                            Navigator.pop(context);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? AppColors.primary.withValues(alpha: 0.1)
                                      : AppColors.surface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color:
                                    isSelected
                                        ? AppColors.primary
                                        : AppColors.surface,
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                size,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                  color:
                                      isSelected
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
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double totalPrice = coffee.precio * quantity;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightGray.withValues(alpha: 0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top: image + name + ingredients
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  coffee.imagen,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.nombre,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      coffee.ingredientes,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(thickness: 0.5, height: 1),
          const SizedBox(height: 12),
          // Bottom: price · size chip · quantity stepper
          Row(
            children: [
              // Dynamic price
              Text(
                '\$ ${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              // Size chip button → opens bottom sheet
              GestureDetector(
                onTap: () => _showSizePicker(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        selectedSize,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 16,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Quantity stepper
              _CircleButton(icon: Icons.remove, onTap: onDecrement),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              _CircleButton(icon: Icons.add, onTap: onIncrement),
            ],
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.lightGray),
        ),
        child: Icon(icon, size: 14, color: AppColors.textPrimary),
      ),
    );
  }
}
