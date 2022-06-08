import 'package:flutter/material.dart';
import 'package:shoeshood/screens/payment_screen.dart';
import 'package:shoeshood/common_widgets/appbar_widget.dart';
import 'package:shoeshood/common_widgets/side_nav.dart';

class MyOrdersScreen extends StatefulWidget {
  static String id = 'user_cart';

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBarWidget(),
        drawer: NavDrawer(),
        backgroundColor: Colors.white,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: MediaQuery.of(context).size.width * 1.2,
                  child: SizedBox(
                      child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 1,
                    childAspectRatio: 2,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent),
                          ),
                          child: Center(
                            child: Text(
                              "Item 1",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent),
                          ),
                          child: Center(
                            child: Text(
                              "Item 2",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent),
                          ),
                          child: Center(
                            child: Text(
                              "Item 3",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent),
                          ),
                          child: Center(
                            child: Text(
                              "Item 4",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent),
                          ),
                          child: Center(
                            child: Text(
                              "Item 5",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Material(
                  elevation: 16.0,
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: MaterialButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentScreen()),
                      );
                    },
                    minWidth: 50.0,
                    height: 5.0,
                    child: Text(
                      r'Place your order | $xxx',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ]));
  }
}
