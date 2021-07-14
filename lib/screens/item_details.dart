import 'package:flutter/material.dart';
import 'package:shoeshood/widgets/appbar_widget.dart';
import 'package:shoeshood/widgets/item_details_widget.dart';
import 'package:shoeshood/widgets/side_nav.dart';

class ItemDetails extends StatefulWidget {
  static String id = 'item_details';

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
        name: "Puma",
        description: "Black color light weight puma shoes",
        image: "image1.jpg",
        price: 500,
        onClickAction: () {
          null;
        },
      ),
    );
  }
}
