import 'package:flutter/material.dart';
import 'package:shoeshood/modules/cart/screens/cart_screen.dart';
import 'package:shoeshood/modules/home/screens/home_screen.dart';
import 'package:shoeshood/modules/profile/screens/profile_screen.dart';
import 'package:shoeshood/modules/settings/screens/settings_screen.dart';
import 'package:shoeshood/utils/size_config.dart';

class AppHome extends StatefulWidget {
  AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  int currentIndex = 1;

  static List<Widget> myScreens = <Widget>[
    MyProfileScreen(),
    HomeScreen(),
    Information(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: myScreens.elementAt(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 10,
        iconSize: 30,
        backgroundColor: Colors.redAccent,
        elevation: 25,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: 'About us',
          ),
        ],
      ),
    );
  }
}
