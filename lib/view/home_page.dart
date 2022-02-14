import 'package:fire_idea_project/provider/home_page_provider.dart';
import 'package:fire_idea_project/service/home_page_service.dart';
import 'package:fire_idea_project/widgets/footer.dart';
import 'package:fire_idea_project/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String route = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageService _service=HomePageService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: Scrollbar(
                child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Provider.of<HomePageProvider>(context).body,
                  const Footer(),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
