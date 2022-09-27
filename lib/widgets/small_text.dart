import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double hight;
  TextOverflow overFlow;
 SmallText({Key? key,
    this.color=const Color(0xFFccc7c5),
    required this.text,
    this.size=12,
    this.hight=1.2,
    this.overFlow =TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      overflow: overFlow,
      style: TextStyle(color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
        height: hight,

      ),

    );
  }
}