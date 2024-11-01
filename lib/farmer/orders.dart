import 'package:flutter/material.dart';
import 'cart_model.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Cart();

    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: cart.items.isEmpty
          ? Center(
        child: Text("Your cart is empty!"),
      )
          : ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(
                'Price: ${item.price.toStringAsFixed(2)} per unit, Quantity: ${item.quantity}'),
            trailing: Text(
                'Total: ${(item.price * item.quantity).toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
