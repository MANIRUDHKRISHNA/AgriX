import 'package:flutter/material.dart';
class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class Cart  {
  // Singleton pattern to ensure a single instance of Cart
  static final Cart _instance = Cart._internal();

  // Factory constructor to return the same instance of the Cart
  factory Cart() {
    return _instance;
  }

  // Private constructor for internal usage
  Cart._internal();

  // List to store items in the cart
  final List<CartItem> _items = [];

  // Getter to return the list of cart items
  List<CartItem> get items => _items;

  // Method to add an item to the cart
  void addItem(CartItem item) {
    _items.add(item);
  }

  // Method to remove an item from the cart
  void removeItem(CartItem item) {
    _items.remove(item);
  }

  // Getter to return the total number of items in the cart
  int get totalItems => _items.length;

  // Getter to calculate the total price of all items in the cart
  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}

