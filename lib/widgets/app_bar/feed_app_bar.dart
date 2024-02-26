import 'package:flutter/material.dart';
import 'package:interview/widgets/app_bar/feed_pop.dart';

class FeedAppBar extends StatelessWidget {
  const FeedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .08,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 80,
                  height: 33,
                ),

                //TITLE
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                    height: 40,
                    child: Image.asset(
                      'assets/images/nasa_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                //RIGHT ICON
                const SortFeedPopup()
              ],
            ),
            //MENU DIVIDER
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
    );
  }
}
