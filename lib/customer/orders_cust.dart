import 'package:flutter/material.dart';
class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: Center(
        child: Text("Welcome to the Order's Screen!"),
      ),
    );
  }
}