import 'package:flutter/material.dart';
import 'package:shoeshood/modules/item/widgets/customer_reviews_widget.dart';
import 'package:shoeshood/modules/home/screens/home_screen.dart';
import 'package:shoeshood/utils/size_config.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(SizeConfig.standardBlockSize * 5.0),
            height: SizeConfig.standardBlockSize * 200.0,
            width: SizeConfig.screenWidth,
            child: Image(
              fit: BoxFit.fitWidth,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${widget.price}/-",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.standardBlockSize * 8.0),
                  width: SizeConfig.screenWidth * 0.5,
                  height: SizeConfig.standardBlockSize * 60,
                  color: Colors.blue,
                  child: DropdownButtonFormField<String>(
                    focusColor: Colors.redAccent,
                    elevation: 5,
                    hint: Text(
                      "Please select a size",
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
                    validator: (value) =>
                        value == null ? 'field required' : null,
                    items: ['7', '8', '9', '10', '11', '12']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
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
            height: SizeConfig.standardBlockSize * 15.0,
          ),
          CustomerReviews(),
        ],
      ),
    );
  }
}
