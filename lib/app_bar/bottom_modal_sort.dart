import 'package:flutter/material.dart';

class BottomModalSort extends StatelessWidget {
  final String description; // 'Sort by', 'Sort feed by', etc.
  final List<Map<String, dynamic>> children;

  const BottomModalSort({
    Key? key,
    required this.description,
    required this.children,
  }) : super(key: key);

  //----------------------------
  // LIFECYCLE METHODS

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: <Widget>[
                  Text(
                    description,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 25),
              child: Column(
                children: _buildChildren() as List<Widget>,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  //----------------------------
  // PRIVATE METHODS

  List _buildChildren() {
    return children.map((child) {
      return GestureDetector(
        onTap: child["onPressed"],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      child["icon"],
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    child["Filter"],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 25.0),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
