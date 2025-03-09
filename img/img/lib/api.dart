import 'dart:convert';
import 'dart:io';

class WorkerService {
  final String _baseURL =
      'https://api.cloudflare.com/client/v4/accounts/272879509af01eaba03d171a587a3a4e/ai/run/@cf/meta/llama-3-8b-instruct';

  final String _apiKey = 'ivjL8TsWxndnoMS3OotG1g5n_TaTKSp_i_mnyKxr';

  Future<String> analyzeImage(File image) async {
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);
  }
}
