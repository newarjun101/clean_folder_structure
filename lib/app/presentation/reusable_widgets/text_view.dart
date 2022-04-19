import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final int? maxLine;
  final TextAlign? textAlign;
  const TextView({Key? key, required this.title, required this.fontSize, this.fontWeight, this.maxLine, this.textAlign, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(color: textColor??Theme.of(context).textTheme.bodyText2!.color!,
        fontWeight: fontWeight,
        fontSize: fontSize
    ),textAlign: textAlign,maxLines: maxLine,);
  }
}