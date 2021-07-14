import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoeshood/widgets/appbar_widget.dart';
import 'package:shoeshood/widgets/display_widget.dart';
import 'package:shoeshood/widgets/side_nav.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBarWidget(),
      drawer: NavDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.15,
              child: Center(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.redAccent)),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Search for your favourite shoes"),
                ),
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.width * 1.20,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 1,
                childAspectRatio: 2,
                scrollDirection: Axis.vertical,
                children: [
                  DisplayWidget(
                    image: "image1.jpg",
                    name: "Puma",
                    price: 2499,
                  ),
                  DisplayWidget(
                    image: "image2.jpg",
                    name: "Aldo",
                    price: 3999,
                  ),
                  DisplayWidget(
                    image: "image3.jpg",
                    name: "Zara",
                    price: 2999,
                  ),
                  DisplayWidget(
                    image: "image4.jpg",
                    name: "Gucci",
                    price: 5999,
                  ),
                  DisplayWidget(
                    image: "image5.jpg",
                    name: "Adidas",
                    price: 1499,
                  ),
                  DisplayWidget(
                    image: "image6.jpg",
                    name: "Nike",
                    price: 1499,
                  ),
                  DisplayWidget(
                    image: "image7.jpg",
                    name: "Vans",
                    price: 1999,
                  ),
                  DisplayWidget(
                    image: "image8.jpg",
                    name: "Lee cooper",
                    price: 2499,
                  ),
                  DisplayWidget(
                    image: "image9.jpg",
                    name: "Reebok",
                    price: 1999,
                  ),
                  DisplayWidget(
                    image: "image10.jpg",
                    name: "Converse",
                    price: 999,
                  ),
                ],
              )),
          // Container(
          //   height: MediaQuery.of(context).size.width * 0.05,
          // ),
          // Container(
          //   height: MediaQuery.of(context).size.width * 0.45,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("images/hurry.jpg"),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
