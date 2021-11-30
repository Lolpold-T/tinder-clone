import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tinder_clone/ui/components/tinder_card.dart';

import 'package:tinder_clone/data/explore_json.dart';
import 'package:tinder_clone/data/icons.dart';
import 'package:tinder_clone/theme/colors.dart';
import 'package:tinder_clone/ui/views/explore/explore_viewmodel.dart';

class ExploreView extends StatefulWidget {
  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView>
    with TickerProviderStateMixin {
  CardController cardController = CardController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModel>.reactive(
      onModelReady: (model) async {
        await model.getLeos();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: white,
        body: getBody(context, model),
        bottomSheet: getBottomSheet(context, model),
      ),
      viewModelBuilder: () => ExploreViewModel(),
    );
  }

  Widget getBody(BuildContext context, ExploreViewModel model) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: Container(
        height: h,
        width: w,
        child: TinderSwapCard(
          animDuration: 200,
          allowVerticalMovement: true,
          swipeUp: true,
          totalNum: model.leos.length,
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 0.75,
          minWidth: MediaQuery.of(context).size.width * 0.9,
          minHeight: MediaQuery.of(context).size.height * 0.6,
          cardBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(
                    width: w,
                    height: h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(model.leos[index].img ?? ''),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: w,
                    height: h,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          black.withOpacity(0.25),
                          black.withOpacity(0),
                        ],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Container(
                                width: w * 0.7,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          model.leos[index].name ?? 'failed',
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          model.leos[index].age ?? 'failed',
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              color: green,
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Recently Active",
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: List.generate(
                                          model.likes(index).length,
                                          (indexLikes) {
                                        if (indexLikes == 0) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: white, width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color:
                                                      white.withOpacity(0.4)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3,
                                                    bottom: 3,
                                                    left: 8,
                                                    right: 8),
                                                child: Text(
                                                  model
                                                      .likes(index)[indexLikes],
                                                  style:
                                                      TextStyle(color: white),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: white.withOpacity(0.2)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3,
                                                  bottom: 3,
                                                  left: 10,
                                                  right: 10),
                                              child: Text(
                                                model.likes(index)[indexLikes],
                                                style: TextStyle(color: white),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: w * 0.2,
                                  child: Center(
                                    child: Icon(
                                      Icons.info,
                                      color: white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          cardController: cardController,
          swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
            /// Get swiping card's alignment
            if (align.x < 0) {
              //Card is LEFT swiping
            } else if (align.x > 0) {
              //Card is RIGHT swiping

            }
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            // Get orientation & index of swiped card!
            if (orientation == CardSwipeOrientation.right)
              model.addLikedLeo(index);
            if (index == (model.leos.length - 1)) {
              model.shuffleCards();
            }
          },
        ),
      ),
    );
  }

  Widget getBottomSheet(BuildContext context, ExploreViewModel model) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 120,
      decoration: BoxDecoration(color: white),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(item_icons.length, (index) {
            return GestureDetector(
              onTap: () {
                switch (index) {
                  case 1:
                    cardController.triggerLeft();
                    break;
                  case 2:
                    cardController.triggerUp();
                    break;
                  case 3:
                    cardController.triggerRight();
                    break;
                }
              },
              child: Container(
                width: item_icons[index]['size'],
                height: item_icons[index]['size'],
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        // changes position of shadow
                      ),
                    ]),
                child: Center(
                  child: SvgPicture.asset(
                    item_icons[index]['icon'],
                    width: item_icons[index]['icon_size'],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
