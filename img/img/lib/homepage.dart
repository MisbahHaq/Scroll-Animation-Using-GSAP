import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  String? _decription;
  bool _isLoading = false;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("AI Vision App")));
  }
}
