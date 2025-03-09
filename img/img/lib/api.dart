import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class WorkerService {
  final String _baseURL = 'https://api.anthropic.com/v1/mesasages';

  final String _apiKey = '';

  Future<String> analyzeImage(File image) async {
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);

    final response = await http.post(
      Uri.parse(_baseURL),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': _apiKey,
        'anthropic-version': '2023-06-01',
      },
      body: jsonEncode({
        'model': 'claude-3-opus-20240229',
        'max_tokens': 50,
        'messages': [
          {
            'role': 'user',
            'content': [
              {
                'type': 'image',
                'source': {
                  'type': 'base64',
                  'media_type': 'image/jpeg',
                  'date': base64Image,
                },
              },
              {
                'type': 'text',
                'text': 'Please describe what you see in this image',
              },
            ],
          },
        ],
      }),
    );

    // succesful response from Claude
  }
}
