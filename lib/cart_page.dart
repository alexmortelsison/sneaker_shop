import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/cart_provider.dart';
import 'package:sneaker_shop/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CartProvider>(context).cart);
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
                  onPressed: () {},
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
