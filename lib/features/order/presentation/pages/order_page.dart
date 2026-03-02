import 'package:flutter/material.dart';
import '../../../home/data/models/coffee.dart';
import '../widgets/order_app_bar.dart';
import '../widgets/order_item_row.dart';
import '../widgets/order_payment_summary.dart';
import '../widgets/order_bottom_bar.dart';

class OrderArgs {
  final Coffee coffee;
  final String selectedSize;

  OrderArgs({required this.coffee, required this.selectedSize});
}

class OrderPage extends StatefulWidget {
  final OrderArgs args;

  const OrderPage({super.key, required this.args});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isDelivery = true;
  int quantity = 1;
  late String selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.args.selectedSize;
  }

  @override
  Widget build(BuildContext context) {
    final coffee = widget.args.coffee;

    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: 0.99),
      appBar: const OrderAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  OrderItemRow(
                    coffee: coffee,
                    selectedSize: selectedSize,
                    onSizeChanged: (s) => setState(() => selectedSize = s),
                    quantity: quantity,
                    onIncrement: () => setState(() => quantity++),
                    onDecrement: () {
                      if (quantity > 1) setState(() => quantity--);
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // Payment Summary pinned above the button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: OrderPaymentSummary(
              price: coffee.precio,
              quantity: quantity,
            ),
          ),
        ],
      ),
      bottomNavigationBar: OrderBottomBar(onOrder: () {}),
    );
  }
}
