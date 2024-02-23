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
  @override
  void initState() {
    super.initState();
    var photoProv = context.read<PhotoProvider>();
    photoProv.fetchPhotos();
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
        body: Column(
          children: [
            //APP BAR
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .05,
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: <Widget>[
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 35,
                          height: 33,
                        ),

                        //TITLE
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'MARS API',
                            ),
                          ],
                        ),
                        //RIGHT ICON
                        SortFeedPopup()
                      ],
                    ),
                    const SizedBox(
                      height: 5,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width,
              child: photoProv.photos.isEmpty
                  ? const Center(
                      child: Text('No images for this filter. Try Again'),
                    )
                  : ListView.builder(
                      itemCount: photoProv.photos.length,
                      itemBuilder: (context, index) {
                        final photo = photoProv.photos[index];
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
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Camera: ${photo.camera}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
