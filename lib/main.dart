import 'package:flutter/material.dart';
import 'package:shoeshood/screens/cart_screen.dart';
import 'package:shoeshood/screens/home_screen.dart';
import 'package:shoeshood/screens/item_details.dart';
import 'package:shoeshood/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoeshood/screens/payment_screen.dart';
import 'package:shoeshood/screens/profile_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webiment',
      theme: ThemeData.light().copyWith(
          textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      )),
      initialRoute: HomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ItemDetails.id: (context) => ItemDetails(),
        PaymentScreen.id: (context) => PaymentScreen(),
        MyCartScreen.id: (context) => MyCartScreen(),
        MyProfileScreen.id: (context) => MyProfileScreen(),
      },
    );
  }
}
