import 'package:flutter/material.dart';
import 'package:jobjunction/constants/app_constants.dart';
import 'package:jobjunction/views/common/exports.dart';
import 'package:jobjunction/views/common/height_spacer.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kDarkPurple.value),
        child: Column(
          children: [
            const HeightSpacer(
              size: 70,
            ),
            Image.asset("assets/images/page1.png"),
            const HeightSpacer(
              size: 70,
            ),
            Column(
              children: [
                ReusableText(
                  text: "Find your dream job",
                  style: appstyle(30, Color(kLight.value), FontWeight.w500),
                ),
                const HeightSpacer(
                  size: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "We help you find your dream job according to your skill set,location,ans preference to build your career",
                    textAlign: TextAlign.center,
                    style: appstyle(16, Color(kLight.value), FontWeight.normal),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
