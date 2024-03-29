import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoeshood/modules/item/widgets/item_details.dart';
import 'package:shoeshood/utils/size_config.dart';

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({
    required this.image,
    required this.name,
    required this.price,
  });

  final String image;
  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                height: SizeConfig.screenHeight * 0.2,
                width: SizeConfig.screenWidth * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image(
                    image: AssetImage("images/$image"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  "$name",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$price/-",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
