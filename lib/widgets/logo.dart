import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';
class Logo extends StatelessWidget {
   Logo({Key? key}) : super(key: key);
  late  Responsive _responsive;
  @override
  Widget build(BuildContext context) {
    _responsive=Responsive(context);
    return  GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context, '/');
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: _responsive.responsiveWidth(forUnInitialDevices: 10)),
        child: Image.asset(
          'assets/Icons/logo_word.png',
          width: _responsive.responsiveHeight(forUnInitialDevices: 25),
          height: _responsive.responsiveHeight(forUnInitialDevices: 5),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
