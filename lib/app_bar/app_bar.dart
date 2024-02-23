import 'package:flutter/material.dart';
import 'package:interview/app_bar/feed_pop.dart';

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                //LEFT ICON
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: SizedBox(
                    width: 35,
                    height: 33,
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/images/topic_menu_icon.png',
                        height: 33,
                      ),
                      onTap: () {
                        // ZoomDrawer.of(context)!.open();
                      },
                    ),
                  ),
                ),
                //TITLE('LEARN')
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'MARS API',
                    ),
                  ],
                ),
                //RIGHT ICON
                //TODO
                const SortFeedPopup()
                // },
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
    );
  }
}
