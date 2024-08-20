
import 'package:flutter/cupertino.dart';

class Textcomponent extends StatelessWidget {
  final String? text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final Color? color;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  const Textcomponent({
    this.text,
    this.fontsize,
    this.fontWeight,
    this.color,
    this.fontStyle,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontsize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        color: color,

      ),

    );
  }
}
