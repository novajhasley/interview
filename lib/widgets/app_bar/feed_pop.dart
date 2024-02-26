import 'package:flutter/material.dart';
import 'package:interview/widgets/app_bar/bottom_modal_sort.dart';

class SortFeedPopup extends StatelessWidget {
  const SortFeedPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 13, bottom: 15),
      child: SizedBox(
        width: 35,
        height: 33,
        child: GestureDetector(
          child: const Icon(
            size: 35,
            Icons.menu,
            color: Colors.red,
          ),
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.black,
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
