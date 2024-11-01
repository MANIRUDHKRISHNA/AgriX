class SharedData {
  static final SharedData _instance = SharedData._internal();
  
  factory SharedData() {
    return _instance;
  }

  SharedData._internal();

  final List<Map<String, String>> marketItems = [];
  final List<Map<String, String>> cartItems = []; // List to store cart items

  void addMarketItem(Map<String, String> item) {
    marketItems.add(item);
  }

  List<Map<String, String>> getMarketItems() {
    return marketItems;
  }

  void addCartItem(Map<String, String> item) {
    cartItems.add(item);
  }

  List<Map<String, String>> getCartItems() {
    return cartItems;
  }

  void removeCartItem(int index) {
    cartItems.removeAt(index);
  }
}
