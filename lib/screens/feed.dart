import 'package:flutter/material.dart';
import 'package:interview/screens/photo_page.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:interview/widgets/app_bar/feed_pop.dart';
import 'package:interview/providers/photo_provider.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  // final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  int _pageSize = 25;

  @override
  void initState() {
    super.initState();
    var photoProv = context.read<PhotoProvider>();
    photoProv.photos.clear();
    photoProv.fetchPhotos();
    // _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // _scrollController.removeListener(_scrollListener);
    // _scrollController.dispose();
    super.dispose();
  }

  // void _scrollListener() {
  //   if (_scrollController.position.pixels ==
  //       _scrollController.position.maxScrollExtent) {
  //     _currentPage++;
  //     fetchPhotos();
  //   }
  // }

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
              height: MediaQuery.of(context).size.height -
                  80, //-80 for APP BAR on Pixel3. May need adjustments.
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                // controller: _scrollController, //TODO: needed for pagination.
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Camera: ${photo.camera}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
