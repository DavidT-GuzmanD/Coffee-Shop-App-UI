import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final String imageUrl;

  const DetailImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 226,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.fitHeight,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
