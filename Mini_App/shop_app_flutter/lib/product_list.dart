import 'package:flutter/material.dart';
import 'package:shop_app_flutter/Global_Variables.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];
  late String selectedFilter; // Used to make list selected.

  // Used to make list selected.
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //setState make it selection work on all selection options.
                        selectedFilter = filter; // Used to make list selected.
                      });
                    },
                    child: Chip(
                      backgroundColor:
                          selectedFilter == filter
                              ? Theme.of(context)
                                  .colorScheme
                                  .primary //Theme.of(context)=> It is used to get nearest ancestor widget so it make easy to get call properties without call all widget hierarchy. If not found nearest it go to root widget. Tree Structure Visualization!
                              : const Color.fromARGB(255, 231, 231, 231),
                      side: const BorderSide(
                        color: Color.fromRGBO(255, 231, 231, 1),
                      ),
                      label: Text(filter),
                      labelStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.5,
                        vertical: 5,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              // Used to display product image.
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                // This part of code is used to navigate page from one to another. START
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      // Stack push give feature to go back but pushreplacement not.
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(product: product);
                        },
                      ),
                    ); //Navigation is used in flutter as stack.
                  },

                  // This part of code is used to navigate page from one to another. END
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor:
                        index.isEven
                            ? const Color.fromARGB(255, 201, 236, 255)
                            : const Color.fromARGB(255, 239, 246, 253),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
