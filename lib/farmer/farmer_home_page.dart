import 'package:agrix/login_screen.dart';
import 'package:agrix/main.dart';
import 'package:flutter/material.dart';
import 'marketplace_screen.dart';
import 'analytics.dart';
import 'weather.dart';
import 'orders.dart';
import 'Transactions.dart';
import 'CustomerSupport.dart';
import 'Tips.dart';
import 'Profile.dart';
import 'Notification.dart';
import 'settings.dart';





// Home Screen with App Drawer
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.green[50],
      appBar: AppBar(
        title: Text('Farmer Dashboard'),
          backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notificationscreen()),
              );
            },
          ),
        ],
      ),

      drawer: AppDrawer(),  // Adding App Drawer here
      body: GridView.count(
        crossAxisCount: 2,
        children: [

          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.analytics_sharp, color: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnalyticsScreen()),
                    );
                  },
                ),
                Text('Market Analysis', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.sunny, color: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeatherScreen()),
                    );
                  },
                ),
                Text('Weather Info', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.shopping_bag, color: Colors.brown),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FarmerMarketPlacePage()),
                    );
                  },
                ),
                Text('Market Places', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.shopping_cart, color: Colors.green),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderScreen()),
                    );
                  },
                ),
                Text('Requests', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.monetization_on, color: Colors.red),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TransactionScreen()),
                    );
                  },
                ),
                Text('Transactions', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.settings, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  },
                ),
                Text('Settings', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),

        ],
      ),

    );




  }

}


// App Drawer Widget
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Text(
                      'F',
                      style: TextStyle(fontSize: 25, color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text('Customer Support'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatbotScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.tips_and_updates),
            title: Text('Tips'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TipsScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Navigate back to WelcomeScreen when the user logs out
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
          ),

        ],
      ),
    );
  }
}