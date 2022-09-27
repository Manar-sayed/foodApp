import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app1/utlis/dimensions.dart';
import 'package:food_app1/widgets/app_column.dart';
import 'package:food_app1/widgets/app_icon.dart';

import '../../utlis/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icons_and_text.dart';
import '../../widgets/small_text.dart';

class popular_food_detail extends StatelessWidget {
  const popular_food_detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height:360,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://i.pinimg.com/564x/2c/f4/27/2cf427ff858ce80432446c1ebb3bfda4.jpg")
                )
              ),
            ),
          ),//image
          Positioned(
            top: Dimensions.width45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                app_icon(icon: Icons.arrow_back_ios_sharp),
                app_icon(icon: Icons.shopping_cart_checkout),
              ],
            ),
          ),//icons
          Positioned(
            left: 0,
            right:0,
            top: Dimensions.popularFoodImgSize-20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(Dimensions.radius30),
               color: Colors.white,
             ),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
        const appColumn(text: "Chinese Side",),
    SizedBox(height: Dimensions.height20,),
    BigText(text: "Introduce",color: Colors.black54,),

  ],
)
          ),),

        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius20*2),
            topLeft: Radius.circular(Dimensions.radius20*2),

          ),
          color: AppColors.buttonBackgroundColor
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),


                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: Colors.white
                ),
                child: Row(
                  children: [
                    Icon(Icons.remove,color: AppColors.signColor,),
                    SizedBox(width: 5,),
                    BigText(text: "0"),
                    SizedBox(width: 5,),

                    Icon(Icons.add,color: AppColors.signColor,),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(17),
                child: BigText(text: "\$10 | Add to card",color: Colors.white,),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20)
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
