import 'package:flutter/material.dart';
import 'package:shoeshood/modules/item/widgets/customer_reviews_widget.dart';
import 'package:shoeshood/modules/home/screens/home_screen.dart';
import 'package:shoeshood/utils/size_config.dart';
import 'package:shoeshood/widgets/buttons.dart';

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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.standardBlockSize * 15.0,
          ),
          Container(
            padding: EdgeInsets.all(SizeConfig.standardBlockSize * 5.0),
            height: SizeConfig.standardBlockSize * 200.0,
            width: SizeConfig.screenWidth,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage("images/${widget.image}"),
            ),
          ),
          SizedBox(
            height: SizeConfig.standardBlockSize * 15.0,
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
            ],
          ),
          ListView.builder(
              // shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, i) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 22,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Text(
                            "${i + 7}",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                );
              }),
          CustomOutlineButton(
              borderColor: Colors.redAccent,
              title: "Add to Cart",
              textColor: Colors.white,
              backgroundColor: Colors.redAccent,
              onTap: () {},
              width: SizeConfig.standardBlockSize * 128.0,
              height: SizeConfig.standardBlockSize * 48.0),
          SizedBox(
            height: SizeConfig.standardBlockSize * 25.0,
          ),
          CustomerReviews(),
          SizedBox(
            height: SizeConfig.standardBlockSize * 25.0,
          ),
        ],
      ),
    );
  }
}
