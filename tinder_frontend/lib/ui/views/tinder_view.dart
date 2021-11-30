import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinder_clone/ui/views/account/account_view.dart';
import 'package:tinder_clone/ui/views/chat/chat_view.dart';
import 'package:tinder_clone/ui/views/explore/explore_view.dart';
import 'package:tinder_clone/ui/views/likes/likes_view.dart';

class TinderView extends StatefulWidget {
  @override
  _TinderViewState createState() => _TinderViewState();
}

class _TinderViewState extends State<TinderView> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [ExploreView(), LikesView(), ChatView(), AccountView()],
    );
  }

  PreferredSize getAppBar() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/explore_active_icon.svg"
          : "assets/images/explore_icon.svg",
      pageIndex == 1
          ? "assets/images/likes_active_icon.svg"
          : "assets/images/likes_icon.svg",
      pageIndex == 2
          ? "assets/images/chat_active_icon.svg"
          : "assets/images/chat_icon.svg",
      pageIndex == 3
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return PreferredSize(
      preferredSize: Size.fromHeight(100.0),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                icon: SvgPicture.asset(
                  bottomItems[index],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
