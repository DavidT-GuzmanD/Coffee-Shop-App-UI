import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/coffee.dart';
import '../widgets/detail_app_bar.dart';
import '../widgets/detail_bottom_bar.dart';
import '../widgets/detail_description.dart';
import '../widgets/detail_image.dart';
import '../widgets/detail_info.dart';
import '../widgets/detail_size_selector.dart';
import '../../../order/presentation/pages/order_page.dart';

class DetailPage extends StatefulWidget {
  final Coffee coffee;

  const DetailPage({super.key, required this.coffee});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: 0.99),
      appBar: const DetailAppBar(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            DetailImage(imageUrl: widget.coffee.imagen),
            const SizedBox(height: 20),
            DetailInfo(coffee: widget.coffee),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: AppColors.textSecondary, thickness: 0.5),
              ),
            ),
            DetailDescription(description: widget.coffee.descripcion),
            const SizedBox(height: 24),
            DetailSizeSelector(
              sizes: widget.coffee.tamanos,
              selectedSize: selectedSize,
              onSizeChanged: (size) => setState(() => selectedSize = size),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: DetailBottomBar(
        price: widget.coffee.precio,
        onTap: () {
          context.push(
            '/order',
            extra: OrderArgs(coffee: widget.coffee, selectedSize: selectedSize),
          );
        },
      ),
    );
  }
}
