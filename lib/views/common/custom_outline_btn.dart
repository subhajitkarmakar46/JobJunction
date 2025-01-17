import 'package:flutter/material.dart';
import 'package:jobjunction/views/common/app_style.dart';
import 'package:jobjunction/views/common/reusable_text.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn(
      {super.key,
      this.height,
      this.width,
      required this.text,
      this.onTap,
      required this.color,
      required this.color2});
  final double? height;
  final double? width;
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color2,
          border: Border.all(
            width: 1,
            color: color,
          ),
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appstyle(
              16,
              color,
              FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
