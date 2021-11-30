import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:stacked/stacked.dart';
import 'package:tinder_clone/data/account_json.dart';
import 'package:tinder_clone/theme/colors.dart';

import 'account_viewmodel.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<AccountViewModel>.reactive(
      onModelReady: (model) async {
        await model.getUser();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: grey.withOpacity(0.2),
        body: ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            width: size.width,
            height: size.height * 0.69,
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 10,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                model.user.img ?? 'assets/images/profile.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${model.user.name}, ${model.user.age}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: grey.withOpacity(0.1),
                                    spreadRadius: 10,
                                    blurRadius: 15,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Icon(
                              Icons.settings,
                              size: 35,
                              color: grey.withOpacity(0.5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "SETTINGS",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: grey.withOpacity(0.8)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: [primary_one, primary_two],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: grey.withOpacity(0.1),
                                            spreadRadius: 10,
                                            blurRadius: 15,
                                            // changes position of shadow
                                          ),
                                        ]),
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 45,
                                      color: white,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 0,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey.withOpacity(0.1),
                                              spreadRadius: 10,
                                              blurRadius: 15,
                                              // changes position of shadow
                                            ),
                                          ]),
                                      child: Center(
                                        child: Icon(Icons.add, color: primary),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ADD MEDIA",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: grey.withOpacity(0.8)),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: grey.withOpacity(0.1),
                                    spreadRadius: 10,
                                    blurRadius: 15,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Icon(
                              Icons.edit,
                              size: 35,
                              color: grey.withOpacity(0.5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "EDIT INFO",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: grey.withOpacity(0.8)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AccountViewModel(),
    );
  }
}
