import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color.fromARGB(255, 247, 124, 23),
                  backgroundImage: AssetImage(
                    cartItem['imageUrl'].toString(),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Delete Product',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: const Text(
                            'Are you sure you want to remove the product from your cart?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeProduct(cartItem);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 187, 49, 40),
                  ),
                ),
                title: Text(
                  cartItem['title'].toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text(
                  'Size: ${cartItem['sizes'].toString()}',
                ),
              );
            }));
  }
}
