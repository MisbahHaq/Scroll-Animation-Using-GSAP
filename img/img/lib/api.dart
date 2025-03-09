import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class WorkerService {
  final String _apiKey =
      'f0a4d7dd-50b4-420e-986e-960beda40cf7'; // Replace with your key

  Future<String> analyzeImage(File image) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://api.deepai.org/api/image-captioning'),
    );

    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    request.headers['api-key'] = _apiKey;

    final response = await request.send();
    final responseData = await response.stream.bytesToString();
    final jsonData = jsonDecode(responseData);

    if (response.statusCode == 200) {
      return jsonData['output'];
    }

    throw Exception("Failed to analyze image: ${response.statusCode}");
  }
}
