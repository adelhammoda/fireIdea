import '../provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomElevatedButton extends StatefulWidget {
  final Size? buttonSize;
  final String text;
  final double? fontSize;
  final void Function()? onPressed;
  final bool dark;

  const CustomElevatedButton(
      {Key? key,
      required this.text,
        this.fontSize,
      this.buttonSize,
      this.onPressed,
       this.dark=true})
      : super(key: key);

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.zero,
            minimumSize: widget.buttonSize,
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            side: BorderSide(
                color:
                   widget.dark? Provider.of<ThemeProvider>(context).theme.bodyTextColor:
                   Provider.of<ThemeProvider>(context).theme.backgroundColor)),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.fontSize,
              color:  widget.dark? Provider.of<ThemeProvider>(context).theme.bodyTextColor:
              Provider.of<ThemeProvider>(context).theme.backgroundColor),
        ));
  }
}
