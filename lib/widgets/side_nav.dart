import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoeshood/screens/home_screen.dart';
import 'package:shoeshood/screens/login_screen.dart';
import 'package:shoeshood/screens/profile_screen.dart';
import 'package:shoeshood/signin_services/firebase_google_signin_service.dart';

class NavDrawer extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;
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
                  CircleAvatar(
                    backgroundImage: NetworkImage(user!.photoURL!),
                    radius: 30,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          user!.displayName!,
                          maxLines: 3,
                          style: TextStyle(color: Colors.white, fontSize: 25),
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
              Icons.home_filled,
              color: Colors.redAccent,
              size: 30.0,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_balance,
              color: Colors.redAccent,
              size: 30.0,
            ),
            title: Text(
              'My Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfileScreen()),
              );
            },
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
}
