import 'package:flutter/material.dart';

import 'package:interview/providers/photo_provider.dart';
import 'package:provider/provider.dart';

class BottomModalSort extends StatefulWidget {
  const BottomModalSort({
    super.key,
  });

  @override
  State<BottomModalSort> createState() => _BottomModalSortState();
}

class _BottomModalSortState extends State<BottomModalSort> {
  //----------------------------

  @override
  Widget build(BuildContext context) {
    final photoProv = context.watch<PhotoProvider>();
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 25),
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: photoProv.camera,
                    onChanged: (value) {
                      photoProv.setCamera(value!);
                      photoProv.photos.clear();
                      // photoProv.currentPage = 1; //TODO: Needs a setter on provider page
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
                            value: photoProv.sol.toDouble(),
                            min: 1000,
                            max: 1500,
                            divisions: 500,
                            label: photoProv.sol.toString(),
                            onChanged: (double value) {
                              photoProv.setSol(value.toInt());
                            },
                          ),
                          Text(photoProv.sol.toString()),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      photoProv.fetchPhotos();
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: const Text('Filter'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
