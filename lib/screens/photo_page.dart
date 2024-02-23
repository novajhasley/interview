// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:interview/models/photo_model.dart';

class PhotoPage extends StatefulWidget {
  final Photo photo;

  const PhotoPage({
    super.key,
    required this.photo,
  });

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.photo.imgSrc,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Sol: ${widget.photo.sol}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Camera: ${widget.photo.camera}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
