import 'package:flutter/material.dart';

class UIText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Color? textColor;
  final AlignmentGeometry containerAlignment;

  const UIText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.textColor,
    this.containerAlignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: containerAlignment,
      child: Text(
        text,
        style: style ?? const TextStyle(),
        textAlign: textAlign,
      ),
    );
  }
}
