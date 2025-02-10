import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AIChatBotScreen extends StatefulWidget {
  const AIChatBotScreen({super.key});

  @override
  _AIChatBotScreenState createState() => _AIChatBotScreenState();
}

class _AIChatBotScreenState extends State<AIChatBotScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];

  Future<void> _sendMessage() async {
    String message = _controller.text;
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'user', 'message': message});
        _controller.clear();
      });

      // Call the API to get AI response
      String aiResponse = await getAIResponse(message);

      setState(() {
        _messages.add({'sender': 'ai', 'message': aiResponse});
      });
    }
  }

  Future<String> getAIResponse(String message) async {
    const String apiUrl = "https://api.openai.com/v1/completions";
    const String apiKey = "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";  // Replace with your API key

    // Set headers for authentication and content type
    Map<String, String> headers = {
      "Authorization": "Bearer $apiKey",
      "Content-Type": "application/json",
    };

    // Body of the POST request
    Map<String, dynamic> body = {
      "model": "text-davinci-003", // Choose your model here
      "prompt": message,
      "max_tokens": 100,
      "temperature": 0.7,
    };

    try {
      // Send the POST request
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(body),
      );

      // Check for successful response
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['choices'][0]['text'].toString().trim();
      } else {
        return "Error: Unable to get response.";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Chat Bot"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: _messages[index]['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: _messages[index]['sender'] == 'user'
                            ? Colors.teal
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _messages[index]['message']!,
                        style: TextStyle(
                          color: _messages[index]['sender'] == 'user'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
