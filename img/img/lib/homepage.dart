import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  String? _description;
  bool _isLoading = false;
  final _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        maxHeight: 1080,
        maxWidth: 1920,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
        await _analyzeImage();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _analyzeImage() async {
    if (_image == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final description = await WorkerService().analyzeImage(_image!);
      setState(() {
        _description = description;
      });
    } catch (e) {
      print(e);
      setState(() {
        _description = "Failed to analyze image";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Vision App")),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.grey.shade300,
            child:
                _image != null
                    ? Image.file(_image!)
                    : Center(child: Text("Choose image..")),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Text("Take Photo"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Text("Pick from Gallery"),
              ),
            ],
          ),
          SizedBox(height: 25),
          if (_isLoading)
            Center(child: CircularProgressIndicator())
          else if (_description != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _description!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
