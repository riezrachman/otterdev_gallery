import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    this.text, {
    Key? key,
    this.isOutlined = false,
    this.color = kPrimaryColor,
    this.borderRadius,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final bool isOutlined;
  final Color color;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: onPressed != null
                  ? isOutlined
                      ? color
                      : Colors.white
                  : null,
            ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        ),
        primary: onPressed != null
            ? isOutlined
                ? Colors.transparent
                : color
            : null,
        side: onPressed != null ? BorderSide(color: color) : null,
      ),
    );
  }
}
