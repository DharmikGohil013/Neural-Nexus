import 'package:flutter/material.dart';

class AIChatbotPage extends StatefulWidget {
  const AIChatbotPage({super.key});

  @override
  _AIChatbotPageState createState() => _AIChatbotPageState();
}

class _AIChatbotPageState extends State<AIChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.add({"user": _controller.text});
      _messages.add({"bot": _getBotResponse(_controller.text)});
      _controller.clear();
    });
  }

  String _getBotResponse(String message) {
    message = message.toLowerCase();
    if (message.contains("hello")) {
      return "Hello! How can I assist you today?";
    } else if (message.contains("health tips")) {
      return "Drink plenty of water, eat healthy, and exercise regularly!";
    } else if (message.contains("symptoms of cold")) {
      return "Common symptoms include runny nose, sore throat, and sneezing.";
    } else {
      return "I'm here to help! Ask me anything about health and fitness.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chatbot'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final entry = _messages[index];
                final isUser = entry.keys.first == "user";
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue.shade800 : Colors.teal.shade600,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      entry.values.first,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
