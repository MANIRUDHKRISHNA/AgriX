import 'dart:async';

import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class Notificationscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text("Notifications"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Mute option
          muteNotifications();
        },
        child: Icon(Icons.notifications_off),
      ),
    );
  }
}

Future<void> main() async {
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true
  );

  // Create a notification every 2 minutes
  Timer.periodic(Duration(minutes: 2), (timer) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'New notification',
        body: 'This is a new notification',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  });

  runApp(
    MaterialApp(
      home: Notificationscreen(),
    ),
  );
}

// Mute option
bool isMuted = false;

void muteNotifications() {
  isMuted = !isMuted;
  if (isMuted) {
    AwesomeNotifications().cancelAll();
  }
}