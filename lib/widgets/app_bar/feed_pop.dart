import 'package:flutter/material.dart';
import 'package:interview/widgets/app_bar/bottom_modal_sort.dart';

class SortFeedPopup extends StatelessWidget {
  const SortFeedPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: SizedBox(
        width: 35,
        height: 33,
        child: GestureDetector(
          child: const Icon(Icons.menu),
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              context: context,
              useRootNavigator: true,
              builder: (BuildContext context) {
                return const BottomModalSort();
              },
            );
          },
        ),
      ),
    );
  }
}
