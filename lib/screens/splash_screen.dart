import 'package:flutter/material.dart';
import 'package:shoeshood/modules/login/screens/login_screen.dart';
import 'package:shoeshood/screens/app_home_screen.dart';
import 'package:shoeshood/services/navigation_service.dart';
import 'package:shoeshood/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigatorService _navigatorService = NavigatorService();

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 4),
        () => _navigatorService.navigate(context, AppHome()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/welcome.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
