import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app1/utlis/colors.dart';
import 'package:food_app1/utlis/dimensions.dart';
import 'package:food_app1/widgets/big_text.dart';
import 'package:food_app1/widgets/icons_and_text.dart';
import 'package:food_app1/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: .90);
var _currPageValue=0.0;
double _scaleFactor=0.8;
double _height=Dimensions.pageViewContainer;
@override
void initState(){
  super.initState();
 pageController.addListener(() {
setState(() {
  _currPageValue = pageController.page!;
});
 });
}
@override
void dispose(){
  pageController.dispose();
}
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          //slider section
          Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
    ),
          //dots
          new DotsIndicator(
    dotsCount: 5,
    position: _currPageValue,
    decorator: DotsDecorator(
      size: Size.square(9.0),
    activeSize: Size(18.0,9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    color: Colors.black26, // Inactive color
    activeColor: AppColors.mainColor,
    ),
    ),
          //popular text
          SizedBox(height: Dimensions.height20,),
          Container(
            margin: EdgeInsets.only(left: Dimensions.width30),
            child: Row(
              children: [
                BigText(text: "Popular")
              ],
            ),
          )
        ],
      );
  }

  Widget _buildPageItem(int index) {
  Matrix4 matrix =new Matrix4.identity();
  if(index==_currPageValue.floor()){
     var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
   var currTrans =_height*(1-currScale)/2;
     matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index ==_currPageValue.floor()+1) {
    var currScale = _scaleFactor +
        (_currPageValue - index + 1) * (1 - _scaleFactor);
    var currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);

  }else if(index ==_currPageValue.floor()-1){
    var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
    var currTrans =_height*(1-currScale)/2;
    matrix =Matrix4.diagonal3Values(1, currScale, 1);
    matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

  }else{
   var currScale=0.8;
   matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor), 1);
  }


    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              // color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/04/67/30/0467307f7ffba52855b478688b93060b.jpg"))),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewContainer/1.8,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height15,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.height10, right: Dimensions.height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    )
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}
