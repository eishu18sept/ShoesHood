import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoeshood/utils/size_config.dart';
import 'package:shoeshood/widgets/appbar_widget.dart';
import 'package:shoeshood/modules/home/widgets/display_widget.dart';
import 'package:shoeshood/widgets/side_nav.dart';
import 'package:shoeshood/modules/item/screens/item_details.dart';
import 'dart:io';

import '../../../main.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

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
    List<int> brandImage = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    List<String> brandName = [
      "Puma",
      "Aldo",
      "Zara",
      "Gucci",
      "Adidas",
      "Nike",
      "Vans",
      "Lee Cooper",
      "Reebok",
      "Converse",
    ];
    List<double> price = [
      1000.00,
      2000.00,
      3000.00,
      4000.00,
      5000.00,
      6000.00,
      7000.00,
      8000.00,
      9000.00,
      10000.00,
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBarWidget(),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Search for your favourite shoes"),
                  ),
                ),
              ),
            ),
            Container(
                height: 1000,
                padding: EdgeInsets.all(SizeConfig.standardBlockSize * 8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 1,
                  scrollDirection: Axis.vertical,
                  children: [
                    for (int i = 0; i < 10; i++)
                      InkWell(
                        child: DisplayWidget(
                          image: "image" + brandImage[i].toString() + ".jpg",
                          name: brandName[i],
                          price: price[i],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemDetails(
                                        itemImage:
                                            "image" + i.toString() + ".jpg",
                                        itemName: brandName[i],
                                        itemPrice: price[i],
                                      )));
                        },
                      ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
