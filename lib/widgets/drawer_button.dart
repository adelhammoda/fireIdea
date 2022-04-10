

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomDrawer({Key? key,required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      print(scaffoldKey.currentState?.hasDrawer);
      scaffoldKey.currentState?.openDrawer();
    }, icon:const Icon(Icons.menu));
  }
}
