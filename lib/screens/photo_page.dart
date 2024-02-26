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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        iconTheme: const IconThemeData(
          color: Colors.red,
        ),
        //TITLE (CAMERA - SOL)
        title: Text(
          '${widget.photo.camera} - ${widget.photo.sol}',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //PHOTO
            Image.network(
              widget.photo.imgSrc,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 8.0),
            //DESCRIPTION
            const Text(
              'Description here',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
