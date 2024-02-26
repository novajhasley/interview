import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interview/screens/photo_page.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:interview/widgets/app_bar/feed_pop.dart';
import 'package:interview/providers/photo_provider.dart';
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
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .08,
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: 80,
                          height: 33,
                        ),

                        //TITLE
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SizedBox(
                            height: 40,
                            child: Image.asset(
                              'assets/images/nasa_logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        //RIGHT ICON
                        const SortFeedPopup()
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 1,
                        ),
                        const Positioned.fill(
                          bottom: -1,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.0,
                              ),
                              child: Divider(
                                color: Color.fromRGBO(40, 77, 115, 1),
                                thickness: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
                                Image.network(
                                  photo.imgSrc,
                                  fit: BoxFit.cover,
                                  height: 300,
                                  width: double.infinity,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  'Sol: ${photo.sol}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                Text(
                                  'Camera: ${photo.camera}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        );
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
