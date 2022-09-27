import 'package:flutter/cupertino.dart';
import 'package:food_app1/utlis/dimensions.dart';

class app_icon extends StatelessWidget {
  final IconData icon;
  final Color bgcolor;
  final Color iconcolor;
  final double size;

  app_icon({
    Key? key,
    required this.icon,
    this.bgcolor = const Color(0xFFfcf4e4),
    this.iconcolor = const Color(0xFF756d54),
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2), color: bgcolor),
      child: Icon(icon,
        color: iconcolor,
        size: Dimensions.iconSize16,
      ),
    );
  }
}
