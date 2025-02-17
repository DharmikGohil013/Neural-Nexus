import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatBotAPI {
  static const String apiKey = 'AIzaSyBEN7lWDrHERtV2hNXlphq_yhROna7EWmE'; // Replace with your OpenAI API key
  static const String apiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=GEMINI_API_KEY';

  // Method to fetch a response from the chatbot
  Future<String> getResponse(String userInput) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode({
        'model': 'text-davinci-003',  // You can change this to other models as per OpenAI
        'prompt': userInput,
        'max_tokens': 150,
      }),
    );

    if (response.statusCode == 200) {
      // Parse the response JSON
      final responseData = json.decode(response.body);
      final String chatbotReply = responseData['choices'][0]['text'].trim();
      return chatbotReply;
    } else {
      return 'Error: Unable to fetch response from the chatbot.';
    }
  }
}
