import 'package:flutter/material.dart';
import 'package:shoeshood/screens/cart_screen.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarWidget({Key? key}) : super(key: key);
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.redAccent,
      title: Text("ShoesHood"),
      actions: <Widget>[
        MaterialButton(
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyCartScreen()));
          },
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ],
    );
  }
}
