import '../models/project_model.dart';
import '../provider/home_page_provider.dart';
// import '../service/home_page_service.dart';
import '../service/home_page_service.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String route = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final HomePageService _service=HomePageService();
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();
  List<Project> projects=[];
  final HomePageService _service = HomePageService();

  void _loadAllProjects()async{

    await _service.getProjectsData().then((data) {
      if (data != null) {
        if (data['projects'] is List) {
          int index = 0;
          for (var projectData in (data['projects'] as List)) {
            projects.add(Project.formJSON(projectData, index.toString()));
            index++;
          }
          setState(() {

          });
        }
      }
    }).catchError((e){
      projects=[];
    });
  }


  @override
  void initState() {
    super.initState();
    _loadAllProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const CustomDrawer(),
      key: _scaffoldKey,
      body: Column(
        children: [
           Header(scaffoldKey: _scaffoldKey,),
          Expanded(
            child: Scrollbar(
                controller: Provider.of<HomePageProvider>(context).scrollController,
                child: SingleChildScrollView(
                  controller: Provider.of<HomePageProvider>(context).scrollController,
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
