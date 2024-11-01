import 'package:flutter/material.dart';
import 'package:agrix/shared_data.dart'; // Import the shared data class


class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  // Method to increase the quantity of an item
  void increaseQuantity() {
    quantity++;
  }

  // Method to decrease the quantity of an item
  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}

class Cart with ChangeNotifier {
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
    notifyListeners(); // Notify the listeners that the cart has changed
  }

  // Method to remove an item from the cart
  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners(); // Notify the listeners that the cart has changed
  }

  // Getter to return the total number of items in the cart
  int get totalItems => _items.length;

  // Getter to calculate the total price of all items in the cart
  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = Cart().items;

    void _removeFromCart(int index) {
      Cart().removeItem(cartItems[index]);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item removed from cart')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Cart Items:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text('Crop Type: ${item.name}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Price per Unit: ₹${item.price.toStringAsFixed(2)}'),
                          Text('Quantity: ${item.quantity}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeFromCart(index),
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

class FarmerMarketPlacePage extends StatefulWidget {
  @override
  FarmerMarketPlacePageState createState() => FarmerMarketPlacePageState();
}

class FarmerMarketPlacePageState extends State<FarmerMarketPlacePage> {
  String? selectedCropType;
  final List<String> cropTypes = ['Wheat', 'Rice', 'Corn', 'Barley'];
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Item Added'),
          content: const Text('The item has been successfully added to the market list.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showConfirmPopup() {
    if (selectedCropType == null || priceController.text.isEmpty || quantityController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Missing Information'),
            content: const Text('Please enter all required fields: crop type, price, and quantity.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      final double price = double.tryParse(priceController.text) ?? 0;
      final int quantity = int.tryParse(quantityController.text) ?? 0;

      Cart().addItem(
        CartItem(
          id: DateTime.now().toString(), // Unique ID
          name: selectedCropType!,
          price: price,
          quantity: quantity,
        ),
      );

      _showSuccessDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Marketplace'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select Crop Type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedCropType,
              hint: Text('Choose a crop'),
              items: cropTypes.map((String crop) {
                return DropdownMenuItem<String>(
                  value: crop,
                  child: Text(crop),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCropType = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Set Price per Unit:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter price in ₹',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Enter Quantity:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter quantity',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showConfirmPopup,
              child: Text('Add to Market'),
            ),
          ],
        ),
      ),
    );
  }
}
