import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //If we create scaffold inside scaffold and put appbar both side then it give space more.
    final cart = Provider.of<CartProvider>(context).cart; //Provider String
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: ListView.builder(
        itemCount: cart.length,
        //Whenever this is builder there is context.
        itemBuilder: (context, index) {
          final cartItem = cart[index];

          //This ListTile is used to return all things we need to return from listview.
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30,
            ),

            trailing: IconButton(
              onPressed: () {
                showDialog(
                  //This restrict that user can't  click outside dialog box.
                  barrierDismissible: false,

                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Delete Product",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text(
                        "Are yu sure you want to remove the product from the cart?",
                      ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(
                              context,
                              listen: false,
                            ).removeProduct(cartItem);
                            Navigator.of(context).pop();
                          },

                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItem['sizes']}'),
          );
        },
      ),
    );
  }
}
