import 'package:flutter/material.dart';
import 'package:shoeshood/widgets/appbar_widget.dart';
import 'package:shoeshood/modules/item/widgets/item_details_widget.dart';
import 'package:shoeshood/widgets/side_nav.dart';

class ItemDetails extends StatefulWidget {
  static String id = 'item_details';

  const ItemDetails({
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
  });

  final String itemImage;
  final String itemName;
  final double itemPrice;

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWidget(),
      drawer: NavDrawer(),
      body: ItemDetailsWidget(
        name: widget.itemName,
        description: "Black color light weight puma shoes",
        image: widget.itemImage,
        price: widget.itemPrice,
        onClickAction: () {
          null;
        },
      ),
    );
  }
}
