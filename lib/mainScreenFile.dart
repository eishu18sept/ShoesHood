import 'package:flutter/material.dart';
import 'package:shoeshood/screens/cart_screen.dart';
import 'package:shoeshood/screens/home_screen.dart';
import 'package:shoeshood/screens/settings_screen.dart';

class MainScreenFile extends StatefulWidget {
  MainScreenFile({Key? key}) : super(key: key);

  @override
  _MainScreenFileState createState() => _MainScreenFileState();
}

class _MainScreenFileState extends State<MainScreenFile> {
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  int currentIndex = 1;

  static List<Widget> myScreens = <Widget>[
    MyOrdersScreen(),
    HomeScreen(),
    Information(),
  ];

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.shopping_bag),
            label: 'My Cart',
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
