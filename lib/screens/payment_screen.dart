import 'package:flutter/material.dart';
import 'package:shoeshood/widgets/appbar_widget.dart';
import 'package:shoeshood/widgets/side_nav.dart';

class PaymentScreen extends StatefulWidget {
  static String id = 'payment_screen';

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWidget(),
      drawer: NavDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Payment screen",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 30.0),
            child: Material(
              color: Color.fromRGBO(35, 10, 120, 1),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () async {},
                minWidth: 50.0,
                height: 42.0,
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
