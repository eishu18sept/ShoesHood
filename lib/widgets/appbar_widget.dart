import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeshood/modules/cart/screens/cart_screen.dart';
import 'package:shoeshood/modules/profile/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoeshood/utils/size_config.dart';

class MyAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBarWidget({Key? key}) : super(key: key);
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<MyAppBarWidget> createState() => _MyAppBarWidgetState();
}

class _MyAppBarWidgetState extends State<MyAppBarWidget> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  User? user = FirebaseAuth.instance.currentUser;

  late Future<int> _counter;
  late String _userAddress = "";

  bool _userAddressEntered = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.redAccent,
      title: Text("ShoesHood"),
      actions: <Widget>[
        IconButton(
          onPressed: () async {},
          icon: Icon(Icons.shop),
        ),
      ],
    );
  }

  showMyProfileDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(width: 1)),
                height: SizeConfig.screenHeight * 0.5,
                width: SizeConfig.screenWidth * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // CircleAvatar(
                    //   backgroundImage: NetworkImage(user!.photoURL!),
                    //   radius: 30,
                    // ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            // user!.displayName!,
                            "Yoo wassup",
                            maxLines: 3,
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      child: _userAddressEntered == true
                          ? Text("Address: $_userAddress")
                          : Column(
                              children: [
                                TextFormField(
                                  onSaved: (String? value) async {
                                    storeUserAddress(value);
                                  },
                                  validator: (value) => value!.isEmpty
                                      ? 'Email cannot be blank'
                                      : null,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                      suffixIcon: Icon(Icons.search),
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.redAccent)),
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      hintText: "Please enter your address"),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      _userAddressEntered = true;
                                    });
                                  },
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                )),
          );
        }).then((val) {
      Navigator.pop(context);
    });
  }

  void storeUserAddress(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString('Address', value.toString());
    });
  }

  void displayUserAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _userAddress = prefs.getString('Address').toString();
  }
}
