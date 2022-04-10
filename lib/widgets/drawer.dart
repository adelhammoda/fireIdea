

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

import '../provider/home_page_provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late final Responsive _responsive ;

  @override
  void didChangeDependencies() {


    super.didChangeDependencies();
    _responsive = Responsive(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/image/white background.png'
            ),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset('assets/Icons/logo.png',),
            ),
            _buildButtons(context, "Projects"),
            _buildButtons(context, "Solutions"),
            _buildButtons(context, "About us"),
            _buildButtons(context, "Contact us "),

          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context,String buttonName){
    return ListTile(
      title: Text(buttonName),
      onTap: () {
        Navigator.of(context).pop();
        Provider.of<HomePageProvider>(context, listen: false)
            .navigateToAnotherPage(buttonName);
      },
      trailing: SizedBox(
        height: _responsive.responsiveWidth(forUnInitialDevices: 10),
        width: _responsive.responsiveWidth(forUnInitialDevices: 10),
          child: Lottie.asset('assets/lottie/arrow.json')),
    );
  }
}



