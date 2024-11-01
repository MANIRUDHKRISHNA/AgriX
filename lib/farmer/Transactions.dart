import 'package:flutter/material.dart';
class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction'),
      ),
      body: Center(
        child: Text("Welcome to the Transaction Screen!"),
      ),
    );
  }
}