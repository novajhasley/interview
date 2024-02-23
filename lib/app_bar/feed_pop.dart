import 'package:flutter/material.dart';
import 'package:interview/app_bar/bottom_modal_sort.dart';

class SortFeedPopup extends StatelessWidget {
  const SortFeedPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: SizedBox(
        width: 35,
        height: 33,
        child: GestureDetector(
          child: Image.asset(
            'assets/images/filter_menu_icon.png',
            height: 33,
            fit: BoxFit.cover,
            color: Colors.blue,
          ),
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
                return BottomModalSort(
                  description: "Filer",
                  children: [
                    {
                      "icon": 'assets/images/icon_best_match.png',
                      "text": 'Camera',
                      "onPressed": () {
                        // context.read<Stories>().applySortToFeed(
                        //       feedTopic: context
                        //           .read<StoryFeedProvider>()
                        //           .selectedTopic,
                        //       sortOrder: StoryFeedSortOrder.bestMatch,
                        //     );
                        // context
                        //     .read<StoryFeedProvider>()
                        //     .redrawStoryFeedFromTop();
                        Navigator.of(context).pop();
                      },
                    },
                    {
                      "icon": 'assets/images/icon_word_count.png',
                      "text": 'Sol',
                      "onPressed": () {
                        // context.read<Stories>().applySortToFeed(
                        //       feedTopic: context
                        //           .read<StoryFeedProvider>()
                        //           .selectedTopic,
                        //       sortOrder: StoryFeedSortOrder.icon_word_count.png
                        //     );
                        // context
                        //     .read<StoryFeedProvider>()
                        //     .redrawStoryFeedFromTop();
                        Navigator.of(context).pop();
                      },
                    },
                    {
                      "icon": 'assets/images/icon_star.png',
                      "text": 'Sort Aphabetically',
                      "onPressed": () {
                        // context.read<Stories>().applySortToFeed(
                        //       feedTopic: context
                        //           .read<StoryFeedProvider>()
                        //           .selectedTopic,
                        //       sortOrder: StoryFeedSortOrder.icon_word_alphabet.png
                        //     );
                        // context
                        //     .read<StoryFeedProvider>()
                        //     .redrawStoryFeedFromTop();
                        Navigator.of(context).pop();
                      },
                    }
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
