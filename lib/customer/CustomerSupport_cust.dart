import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  // Predefined questions
  final List<String> _predefinedQuestions = [
    'Hello',
    'What is your name',
    'How do I track my order',
    'What is your return policy',
    'How do I list my crops for sale?',
    'How can I view the crops I have listed for sale?'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot Customer Care'),
      ),
      body: Column(
        children: [
          // Buttons for predefined questions
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _predefinedQuestions.map((question) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      _messageController.text = question;
                    },
                    child: Text(question, textAlign: TextAlign.center),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatMessageWidget(_messages[index]);
              },
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  child: Text('Send'),
                  onPressed: () {
                    _handleMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(text: message, isUser: true));
      });
      _messageController.clear();
      _respondToMessage(message);
    }
  }

  void _respondToMessage(String message) {
    final response = _getResponse(message);
    if (response != null) {
      setState(() {
        _messages.add(ChatMessage(text: response, isUser: false));
      });
    }
  }

  String? _getResponse(String message) {
    switch (message.toLowerCase()) {
      case 'hello':
      case 'hi':
        return 'Hello! How can I assist you today?';
      case 'what is your name':
        return 'My name is Chatbot, and I\'m here to help you with any questions or concerns you may have.';
      case 'how do i track my order':
        return 'You can track your order by logging into your account and clicking on the "Order History" tab.';
      case 'what is your return policy':
        return 'Our return policy allows you to return items within 7 days of delivery. Please see our website for more details.';
      case 'how do i list my crops for sale?':
        return 'To list your crops for sale, go to the "Marketplace" section of the app. Select the type of crop you want to sell from the dropdown menu, enter the price per unit, and click the "Sell" button. Your crop will then be listed for others to purchase.';
      case 'how can i view the crops i have listed for sale?':
        return 'You can view your listed crops by going to the "Orders" section. All of your active listings will be displayed there, along with their prices. You can also manage or remove any listings from this screen.';
      default:
        return 'Our team will reach out to you soon (Contact: 6969696969; Email: Hackaholics@gmail.com)';
    }
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  ChatMessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: message.isUser
          ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
          : EdgeInsets.only(top: 8, bottom: 8, right: 80),
      decoration: BoxDecoration(
        color: message.isUser ? Colors.blue[200] : Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(message.text),
    );
  }
}
