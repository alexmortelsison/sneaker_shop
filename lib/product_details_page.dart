import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Details',
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.product['imageUrl'] as String,
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 247, 124, 23)),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 247, 124, 23),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(
                              size.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: selectedSize == size
                                ? const Color.fromARGB(255, 247, 124, 23)
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 247, 124, 23),
                        minimumSize: const Size(
                          double.infinity,
                          50,
                        )),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Add To Cart',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
