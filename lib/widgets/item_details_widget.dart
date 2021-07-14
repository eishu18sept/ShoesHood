import 'package:flutter/material.dart';
import 'package:shoeshood/screens/home_screen.dart';

class ItemDetailsWidget extends StatelessWidget {
  const ItemDetailsWidget({
    required this.onClickAction,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  final String image;
  final String name;
  final String description;
  final double price;
  final Function onClickAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            child: Image(
              height: 250.0,
              width: 250.0,
              image: AssetImage("images/$image"),
            ),
          ),
          Text(
            "$name",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "$description",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "$price/-",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                focusColor: Colors.redAccent,
                elevation: 5,
                hint: Text(
                  "Please select your size",
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                style: TextStyle(color: Colors.black),
                iconEnabledColor: Colors.black,
                dropdownColor: Colors.red[200],
                items: <String>['7', '8', '9', '10', '11', '12']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(
                width: 15.0,
              ),
              DropdownButton<String>(
                focusColor: Colors.redAccent,
                elevation: 5,
                hint: Text(
                  "Please select your color",
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                style: TextStyle(color: Colors.black),
                iconEnabledColor: Colors.black,
                dropdownColor: Colors.red[200],
                items: <String>[
                  'black',
                  'white',
                  'red',
                  'green',
                  'yello',
                  'brown'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Material(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ItemDetails()));
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: new Text(
              "Go back",
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
