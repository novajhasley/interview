import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview/feed.dart';
import 'package:interview/models/photo_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late List<Photo> photos;
  String selectedCamera = 'all';
  int selectedSolMin = 1000;
  int selectedSolMax = 1500;
  int sol = 1000;
  String camera = "RHAZ";
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  int _pageSize = 25;

  @override
  void initState() {
    super.initState();
    photos = [];
    fetchPhotos();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _currentPage++;
      fetchPhotos();
    }
  }

  Future<void> fetchPhotos() async {
    const apiKey = 'DEMO_KEY';
    final apiUrl =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=$apiKey&sol=$sol&camera=$camera';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['photos'];
      setState(() {
        photos.addAll(
            data.map((photoJson) => Photo.fromJson(photoJson)).toList());
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  List<Photo> getFilteredPhotos() {
    if (selectedCamera == 'all') {
      return photos;
    } else {
      return photos.where((photo) => photo.camera == selectedCamera).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mars Rover Photos'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedCamera,
            onChanged: (value) {
              setState(() {
                selectedCamera = value!;
              });
              photos.clear();
              _currentPage = 1;
              fetchPhotos();
            },
            items: [
              'all',
              'FHAZ',
              'RHAZ',
              'MAST',
              'CHEMCAM',
              'MAHLI',
              'MARDI',
              'NAVCAM',
              'PANCAM',
              'MINITES'
            ]
                .map((camera) => DropdownMenuItem(
                      value: camera,
                      child: Text(camera),
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sol: '),
                  Slider(
                    value: sol.toDouble(),
                    min: 1000,
                    max: 1500,
                    divisions: 500,
                    label: sol.toString(),
                    onChanged: (double value) {
                      setState(() {
                        sol = value.toInt();
                      });
                    },
                  ),
                  Text(' $sol'),
                ],
              ),
            ],
          ),
          // Expanded(
          //   child:
          SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: ListTile(
                    title: Text('Sol: ${photo.sol}'),
                    subtitle: Text('Camera: ${photo.camera}'),
                    leading: Image.network(photo.imgSrc),
                  ),
                );
              },
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
