import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  const CutomButton(
      {super.key,
      required this.text,
      required this.backgroundcolor,
      required this.foregroundcolor,
      this.borderRadius,
      this.fontsize, this.onPressed});
      final void Function()? onPressed;
  final double? fontsize;
  final String text;
  final Color backgroundcolor;
  final Color foregroundcolor;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            fontSize: fontsize,
            color: foregroundcolor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
