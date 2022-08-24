import 'package:flutter/material.dart';
import 'package:shoeshood/widgets/appbar_widget.dart';
import 'package:shoeshood/widgets/side_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWidget(),
      drawer: NavDrawer(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text("""Eishu Pal""",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset(
                        'images/logo.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'Enquiries : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '9999313658',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'Group Stay Reservations: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '7599329399',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: 10,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'All other Assistance and Technical Support: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '908-50-60000, 602-6000006',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
