import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app1/home/food_page_body.dart';
import 'package:food_app1/utlis/colors.dart';
import 'package:food_app1/utlis/dimensions.dart';
import 'package:food_app1/widgets/big_text.dart';
import 'package:food_app1/widgets/small_text.dart';

class main_food extends StatefulWidget {
  const main_food({Key? key}) : super(key: key);

  @override
  State<main_food> createState() => _main_foodState();
}

class _main_foodState extends State<main_food> {
  @override
  Widget build(BuildContext context) {
    print("current height is "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: Dimensions.height30,horizontal: Dimensions.width10),
        child: Column(

          children:[
            SizedBox(height: Dimensions.height20,),
            Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                BigText(text: "Bangladesh",color: AppColors.mainColor,),
               Row(children: [
                 SmallText(text: "narsigngdi",color: Colors.black54,),
                 Icon(Icons.arrow_drop_down_sharp)
               ],)
              ],),
              Container(width: Dimensions.height45,height: Dimensions.height45,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor,
              ),
                child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconSize24,),
              )
            ],
          ),

            FoodPageBody(),

     ] ),
      ),
    );
  }
}
