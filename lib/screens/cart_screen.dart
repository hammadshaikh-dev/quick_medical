import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: cart.items.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        leading: const Placeholder(fallbackWidth: 50, fallbackHeight: 50), // Image
                        title: Text(item.name),
                        subtitle: Text('Rs.${item.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => cart.updateQuantity(index, item.quantity > 1 ? item.quantity - 1 : 1),
                            ),
                            Text('${item.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => cart.updateQuantity(index, item.quantity < 10 ? item.quantity + 1 : item.quantity),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Payment Summary'),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Order Total'), Text('Rs.${cart.total.toStringAsFixed(2)}')]),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Items Discount'), Text('-Rs.15.80')]),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Coupon Discount'), Text('-Rs.0')]),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Shipping'), Text('Free')]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Total'), Text('Rs.${(cart.total - 15.80).clamp(0, double.infinity).toStringAsFixed(2)}')],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                cart.clear();  // Use the new clear method
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Order placed successfully!')),
                );
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              child: const Text('Place Order'),
            ),
          ),
        ],
      ),
    );
  }
}