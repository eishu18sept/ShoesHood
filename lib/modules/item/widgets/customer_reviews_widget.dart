import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoeshood/utils/size_config.dart';

class CustomerReviews extends StatelessWidget {
  const CustomerReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.standardBlockSize * 8.0),
      width: SizeConfig.screenWidth * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            "Give Review",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: SizeConfig.standardBlockSize * 10,
          ),
          RatingBar.builder(
            initialRating: 0,
            minRating: 0,
            direction: Axis.horizontal,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
              Fluttertoast.showToast(
                  msg: "You've rated $rating stars",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Color.fromARGB(255, 78, 76, 76),
                  textColor: Color.fromARGB(255, 237, 232, 232),
                  fontSize: 16.0);
            },
          )
        ],
      ),
    );
  }
}
