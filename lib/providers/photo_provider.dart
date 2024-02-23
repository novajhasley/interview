import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interview/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoProvider extends ChangeNotifier {
  final int _selectedSolMin = 1000;
  final int _selectedSolMax = 1500;
  String _camera = "all";
  final List<Photo> _photos = [];
  int _sol = 1000;

  int get selectedSolMin => _selectedSolMin;
  int get selectedSolMax => _selectedSolMax;
  String get camera => _camera;
  List<Photo> get photos => _photos;
  int get sol => _sol;

  void setCamera(String value) {
    _camera = value;
    notifyListeners();
  }

  void setSol(int value) {
    _sol = value.toInt();
    notifyListeners();
  }

  Future<void> fetchPhotos() async {
    const apiKey = 'DEMO_KEY';
    final apiUrl =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=$apiKey&sol=$sol&camera=$camera';

    final response = await http.get(Uri.parse(apiUrl));
    // print(response.body);
    //I am currently getting this error from this print statement:
    //"You have exceeded your rate limit. Try again later or contact us at https://api.nasa.gov:443/contact/ for assistance"
    //I'll try again later
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['photos'];
      photos
          .addAll(data.map((photoJson) => Photo.fromJson(photoJson)).toList());
      notifyListeners();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
