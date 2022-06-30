import 'package:flutter/material.dart';
import 'package:shoeshood/common_widgets/customer_reviews_widget.dart';
import 'package:shoeshood/screens/home_screen.dart';

class ItemDetailsWidget extends StatefulWidget {
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
  State<ItemDetailsWidget> createState() => _ItemDetailsWidgetState();
}

class _ItemDetailsWidgetState extends State<ItemDetailsWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  String? selectedSalutation;

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
              image: AssetImage("images/${widget.image}"),
            ),
          ),
          Text(
            "${widget.name}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "${widget.description}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "${widget.price}/-",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Form(
            key: _formKey,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              color: Colors.blue,
              child: DropdownButtonFormField<String>(
                focusColor: Colors.redAccent,
                elevation: 5,
                hint: Text(
                  "Please select your size",
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                style: TextStyle(color: Colors.black),
                iconEnabledColor: Colors.black,
                dropdownColor: Colors.red[200],
                value: selectedSalutation,
                onChanged: (salutation) =>
                    setState(() => selectedSalutation = salutation),
                validator: (value) => value == null ? 'field required' : null,
                items: ['7', '8', '9', '10', '11', '12']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              // DropdownButton<String>(
              //   focusColor: Colors.redAccent,
              //   elevation: 5,
              //   hint: Text(
              //     "Please select your size",
              //     maxLines: 2,
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 14,
              //     ),
              //   ),
              //   style: TextStyle(color: Colors.black),
              //   iconEnabledColor: Colors.black,
              //   dropdownColor: Colors.red[200],
              //   items: <String>['7', '8', '9', '10', '11', '12']
              //       .map((String value) {
              //     validator:
              //     (value) => value == null ? 'field required' : null;
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: new Text(value),
              //     );
              //   }).toList(),
              //   onChanged: (_) {},
              // ),
            ),
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
                  onPressed:
                  () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  };
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ItemDetails()));
                },
                child: Text(
                  'Buy now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomerReviews(),
        ],
      ),
    );
  }
}
