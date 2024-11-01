import 'package:flutter/material.dart';
import 'package:agrix/shared_data.dart'; // Import the shared data class

class FarmerMarketPlacePage extends StatefulWidget {
  @override
  _FarmerMarketPlacePageState createState() => _FarmerMarketPlacePageState();
}

class _FarmerMarketPlacePageState extends State<FarmerMarketPlacePage> {
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
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Crop Type: $selectedCropType'),
              Text('Price per Unit: ${priceController.text}'),
              Text('Quantity: ${quantityController.text}'),
              const SizedBox(height: 16.0),
              const Text('Are you sure you want to add this item to the market list?'),
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
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  SharedData().addMarketItem({
                    'cropType': selectedCropType!,
                    'price': priceController.text,
                    'quantity': quantityController.text,
                  });
                  priceController.clear();
                  quantityController.clear();
                  selectedCropType = null; // Reset dropdown
                });
                _showSuccessDialog();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(int index) {
    setState(() {
      SharedData().marketItems.removeAt(index); // Remove item from SharedData
    });
  }

  @override
  Widget build(BuildContext context) {
    final marketItems = SharedData().getMarketItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Crop Type Dropdown with styling
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: DropdownButton<String>(
                value: selectedCropType,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCropType = newValue;
                  });
                },
                items: cropTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true, // Ensures the dropdown takes full width
                underline: Container(), // Hides the default underline
                hint: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Select Crop Type'),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Price TextField
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Price per Unit',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            // Quantity TextField
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(
                labelText: 'Enter Quantity',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // Sell Button
            ElevatedButton(
              onPressed: _showConfirmPopup,
              child: const Text('Sell'),
            ),
            const SizedBox(height: 20),
            // Display Added Items
            Text(
              'Added Items:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: marketItems.length,
                itemBuilder: (context, index) {
                  final item = marketItems[index];
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
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteItem(index),
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
