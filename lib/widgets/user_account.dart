
import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';
class UserAccount extends StatelessWidget {
  final Responsive responsive;
  const UserAccount({Key? key,required this.responsive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('ENG'),
        SizedBox(
          width: responsive.responsiveWidth(forUnInitialDevices: 1.5),
        ),
        Container(
          width: 1,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15)),
          height: responsive.responsiveHeight(forUnInitialDevices: 4),
        ),
        SizedBox(
          width: responsive.responsiveWidth(forUnInitialDevices: 1.5),
        ),
        Image.asset('assets/Icons/person.png')
      ],
    );
  }
}
