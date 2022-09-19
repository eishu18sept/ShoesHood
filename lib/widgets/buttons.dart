import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color textColor;
  final Color backgroundColor;
  final double width;
  final double height;
  final Color borderColor;

  const CustomOutlineButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.width,
    required this.height,
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: borderColor),
        ),
        fixedSize: Size(width, height),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: textColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
