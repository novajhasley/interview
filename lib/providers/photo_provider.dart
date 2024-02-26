import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interview/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoProvider extends ChangeNotifier {
  final int _selectedSolMin = 1000;
  final int _selectedSolMax = 1500;
  String _camera = "all";
  List<Photo> _photos = [];
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

  Future<void> fetchPhotos(int currentPage) async {
    const apiKey = 'DEMO_KEY';
    const itemsPerPage = 25;
    String apiUrl =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=$apiKey&sol=$_sol';

    if (_camera != "all") {
      apiUrl += "&camera=$_camera";
    }

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['photos'];
      final startIndex = (currentPage - 1) * itemsPerPage;
      final endIndex = min(startIndex + itemsPerPage, data.length);
      _photos = data
          .sublist(startIndex, endIndex)
          .map<Photo>((photoJson) => Photo.fromJson(photoJson))
          .toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
