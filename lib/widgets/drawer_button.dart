

import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerButton({Key? key,required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){

      scaffoldKey.currentState?.openDrawer();
    }, icon:const Icon(Icons.menu));
  }
}
