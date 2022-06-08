import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoeshood/screens/home_screen.dart';
import 'package:shoeshood/screens/login_screen.dart';
import 'package:shoeshood/screens/profile_screen.dart';
import 'package:shoeshood/signin_services/firebase_google_signin_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  // User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * 0.3,
            child: DrawerHeader(
              child: Row(
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
                          "ShoesHood",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          "Step into the world of shoes",
                          // user!.displayName!,
                          maxLines: 3,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_balance,
              color: Colors.redAccent,
              size: 30.0,
            ),
            title: Text(
              'Change App Theme',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            onTap: () async {
              AdaptiveTheme.of(context).toggleThemeMode();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.whatsapp,
              color: Colors.redAccent,
              size: 30.0,
            ),
            title: Text(
              'Need help? Connect with us on whatsapp',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            onTap: _launchUrl,
          ),
          ListTile(
              leading: Icon(
                Icons.input,
                color: Colors.redAccent,
                size: 30.0,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              onTap: () async {
                FirebaseService service = new FirebaseService();
                await service.signOutFromGoogle();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }),
        ],
      ),
    );
  }

  final Uri _url =
      Uri.parse("https://api.whatsapp.com/send?phone=919999313658");
  // Uri.parse("www.fb.com");
  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
