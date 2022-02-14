import 'dart:math';

import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final void Function()? onPressed;
  final double angle;
  final double iconSize;

  const ArrowButton(
      {Key? key, this.onPressed, this.angle = pi, required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 10,
        minWidth: iconSize*1.5,
        height: iconSize*1.5,
        // padding: EdgeInsets.symmetric(
        //    vertical: iconSize.sign*0.6,
        //    horizontal: iconSize.sign*0.4),
        color: Colors.white,
        shape: const CircleBorder(),
        child: Image.asset(
            'assets/Icons/arrow.png',
            width: iconSize*0.8,
            height: iconSize*0.8,
            fit: BoxFit.contain,
          ),
      ),
    );
  }
}
