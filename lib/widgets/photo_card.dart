import 'package:flutter/material.dart';
import 'package:interview/models/photo_model.dart';
import 'package:interview/screens/photo_page.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    super.key,
    required this.photo,
  });

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoPage(photo: photo),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //PHOTO
            Image.network(
              photo.imgSrc,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 8.0),
            //DESCRIPTION
            Text(
              'Camera: ${photo.camera}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              'Sol: ${photo.sol}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const Divider(
              color: Color.fromARGB(255, 102, 102, 102),
            )
          ],
        ),
      ),
    );
  }
}
