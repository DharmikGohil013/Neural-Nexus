import 'package:flutter/material.dart';
import 'ChatBotAPI.dart'; // Import the API file

class AIBotScreen extends StatefulWidget {
  const AIBotScreen({super.key});

  @override
  _AIBotScreenState createState() => _AIBotScreenState();
}

class _AIBotScreenState extends State<AIBotScreen> {
  TextEditingController _controller = TextEditingController();
  String _response = '';
  bool _isLoading = false;

  // Method to handle user input and get a response from the API
  void _getChatbotResponse(String userInput) async {
    setState(() {
      _isLoading = true;
    });
    String response = await ChatBotAPI().getResponse(userInput);
    setState(() {
      _response = response;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Chatbot"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display chat history and response
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User: ${_controller.text}", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _isLoading
                        ? CircularProgressIndicator()
                        : Text("Bot: $_response", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Text input for user query
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Ask me something",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Send button
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _getChatbotResponse(_controller.text);
                  _controller.clear();  // Clear the input field after sending
                }
              },
    child: Text("Send"),
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.teal,  // Use backgroundColor instead of primary
    padding: EdgeInsets.symmetric(vertical: 15),

    ),
            ),
          ],
        ),
      ),
    );
  }
}
