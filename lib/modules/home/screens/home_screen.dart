import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoeshood/utils/constants.dart';
import 'package:shoeshood/utils/size_config.dart';
import 'package:shoeshood/widgets/appbar_widget.dart';
import 'package:shoeshood/modules/home/widgets/display_widget.dart';
import 'package:shoeshood/widgets/side_nav.dart';
import 'package:shoeshood/modules/item/widgets/item_details.dart';
import 'dart:io';

import '../../../main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleSignIn _googleSignIn;
  late User _user;

  HomeScreen(User user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBarWidget(),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(SizeConfig.standardBlockSize * 10.0),
              child: Container(
                height: SizeConfig.standardBlockSize * 50.0,
                child: Center(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.redAccent)),
                        hintText: "Search for your favourite shoes"),
                  ),
                ),
              ),
            ),
            Container(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    return InkWell(
                      child: DisplayWidget(
                        image: "image" + "$i" + ".jpg",
                        name: Constants.brandName[i],
                        price: Constants.price[i],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemDetails(
                                      itemImage:
                                          "image" + i.toString() + ".jpg",
                                      description: Constants.description[i],
                                      itemName: Constants.brandName[i],
                                      itemPrice: Constants.price[i],
                                    )));
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
