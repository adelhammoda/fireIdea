import 'package:fire_idea_project/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';

class LeftSideImage extends StatefulWidget {
  final String text;
  final String buttonText;
  final String imageURl;
  final void Function()? onPressed;

   const LeftSideImage({Key? key, required this.text,
    required this.onPressed,
    required this.buttonText,
    required this.imageURl,})
      : super(key: key);

  @override
  _LeftSideImageState createState() => _LeftSideImageState();
}

class _LeftSideImageState extends State<LeftSideImage> {
  late Responsive _responsive;

  @override
  Widget build(BuildContext context) {
    _responsive = Responsive(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          widget.imageURl,
          width: _responsive.responsiveWidth(forUnInitialDevices: 40),
          height: _responsive.responsiveWidth(forUnInitialDevices: 30),
          fit: BoxFit.fill,
        ),
        Padding(
          padding:EdgeInsets.only(left: _responsive.responsiveWidth(forUnInitialDevices: 10)),
          child: SizedBox(
            width: _responsive.responsiveWidth(forUnInitialDevices: 20),
            child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: _responsive.responsiveValue(
                      forUnInitialDevices: 1.4)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left:  _responsive.responsiveWidth(forUnInitialDevices: 10),
              top:
              _responsive.responsiveHeight(forUnInitialDevices: 3)),
          child: CustomElevatedButton(

            text: widget.buttonText,
            buttonSize: Size(
              _responsive.responsiveHeight(forUnInitialDevices: 13),
              _responsive.responsiveHeight(forUnInitialDevices: 5),
            ),
            onPressed: widget.onPressed,
          ),
        ),
      ],
    );
  }
}
