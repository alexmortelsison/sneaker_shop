import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Converse'];

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 218, 218, 218),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return Scaffold(
      body: Center(
          child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'images/okmpng.png',
                  width: 200,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      border: border,
                      enabledBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Chip(
                          backgroundColor:
                              const Color.fromARGB(255, 233, 233, 233),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 233, 233, 233),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          label: Text(filter),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      );
                    })),
          ],
        ),
      )),
    );
  }
}
