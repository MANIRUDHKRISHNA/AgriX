import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriX',
      theme: ThemeData(
        primarySwatch: Colors.green, // Green theme for the app
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(title: Text('Welcome To AgriX',style:TextStyle(fontWeight: FontWeight.bold)),backgroundColor: Colors.green),
      body: Stack(
        children: [
          // Background Image of cornfield at sunset


          // Centered buttons over the background
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(userType: 'Farmer'),
                      ),
                    );
                  },
                  child: Text('I am a Farmer',style:TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(userType: 'Customer'),
                      ),
                    );
                  },
                  child: Text('I am a Customer',style:TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
