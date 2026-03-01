import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class DetailDescription extends StatefulWidget {
  final String description;

  const DetailDescription({super.key, required this.description});

  @override
  State<DetailDescription> createState() => _DetailDescriptionState();
}

class _DetailDescriptionState extends State<DetailDescription> {
  bool isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            setState(() {
              isDescriptionExpanded = !isDescriptionExpanded;
            });
          },
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text:
                      isDescriptionExpanded
                          ? widget.description
                          : '${widget.description.substring(0, widget.description.length > 80 ? 80 : widget.description.length)}...',
                ),
                TextSpan(
                  text: isDescriptionExpanded ? ' Show Less' : ' Read More',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
