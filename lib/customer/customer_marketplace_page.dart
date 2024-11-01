import 'package:flutter/material.dart';
import 'cart_model_cust.dart'; // Import your cart model
import 'cart_page.dart'; // Import your order screen
import '../shared_data.dart'; // Import the shared data class
import 'cart_cust.dart'; // Import the cart page

class CustomerMarketPlacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = SharedData().getMarketItems();

    void _showAddToCartPopup(Map<String, String> item) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add to Cart'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Crop Type: ${item['cropType']}'),
                Text('Price per Unit: ${item['price']}'),
                Text('Quantity: ${item['quantity']}'),
                const SizedBox(height: 16.0),
                const Text('Do you want to add this item to your cart?'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Add to Cart'),
                onPressed: () {
                  Navigator.of(context).pop();
                  SharedData().addCartItem(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item['cropType']} added to cart')),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Marketplace'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cartpage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Available Items:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text('Crop Type: ${item['cropType']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Price per Unit: ${item['price']}'),
                          Text('Quantity: ${item['quantity']}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.add_shopping_cart, color: Colors.green),
                        onPressed: () => _showAddToCartPopup(item),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}