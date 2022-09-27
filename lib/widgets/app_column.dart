import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app1/widgets/small_text.dart';

import '../utlis/colors.dart';
import '../utlis/dimensions.dart';
import 'big_text.dart';
import 'icons_and_text.dart';

class appColumn extends StatelessWidget {
  final String text;
  const appColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(

                    Icons.star,
                    color: AppColors.mainColor,
                    size: 20,
                  )),
            ),
            SizedBox(width: 15,),
            SmallText(text: "4.5"),
            SizedBox(width: 5,),

            SmallText(text: "1287"),
            SizedBox(width: 5,),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconAndText(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor),
            IconAndText(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
      ],
    );
  }
}
