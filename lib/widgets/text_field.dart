import '../provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String textMessage;
  final int maxLines;
  final int minLines;

  const CustomTextField(
      {Key? key,
      required this.textMessage,
      required this.hint,
      this.maxLines = 1,
      this.minLines = 1})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  Color _textColor = const Color(0xff707070);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _textColor = _focusNode.hasFocus
            ? Provider.of<ThemeProvider>(context, listen: false)
                .theme
                .focusColor
            : Provider.of<ThemeProvider>(context, listen: false)
                .theme
                .unFocusColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textMessage,
          style: TextStyle(color: _textColor),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          style: TextStyle(
              color: Provider.of<ThemeProvider>(context).theme.primaryColor),
          focusNode: _focusNode,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Provider.of<ThemeProvider>(context).theme.unFocusColor,
              )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Provider.of<ThemeProvider>(context).theme.focusColor,
              )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Provider.of<ThemeProvider>(context).theme.focusColor,
              )),
              hintText: widget.hint,
              hintStyle: TextStyle(
                  color:
                      Provider.of<ThemeProvider>(context).theme.unFocusColor)),
        ),
      ],
    );
  }
}
