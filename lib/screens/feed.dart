import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interview/models/photo_model.dart';
import 'package:interview/screens/photo_page.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:interview/providers/photo_provider.dart';
import 'package:interview/widgets/app_bar/feed_app_bar.dart';
import 'package:interview/widgets/photo_card.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    var photoProv = context.read<PhotoProvider>();
    photoProv.fetchPhotos(currentPage);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photoProv = context.watch<PhotoProvider>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            //APP BAR
            const FeedAppBar(),
            //BODY (LIST OF ASTEROIDS)
            Expanded(
              child: photoProv.photos.isEmpty
                  ? const Center(
                      child: Text(
                        'No images for this filter. Try Again',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : ListView.builder(
                      itemCount: min(25, photoProv.photos.length),
                      itemBuilder: (context, index) {
                        final photo = photoProv.photos[index];
                        //PHOTO CARD
                        return PhotoCard(photo: photo);
                      },
                    ),
            ),
            //BOTTOM NAVIGATION BAR
            Container(
              height: 70,
              color: Colors.grey[850],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (currentPage > 1)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          currentPage--;
                        });
                        photoProv.fetchPhotos(currentPage);
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back, color: Colors.white),
                          Text(' Previous Page',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        currentPage++;
                      });
                      photoProv.fetchPhotos(currentPage);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_forward, color: Colors.white),
                        Text(' Next Page',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
