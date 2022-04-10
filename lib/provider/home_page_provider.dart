import '../service/home_page_service.dart';
import '../view/aboutUs.dart';
import '../view/contact_us.dart';
import '../view/projects.dart';
import '../view/solutions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier {
  Widget body=const Projects();
  final ScrollController scrollController= ScrollController();
  String pageName = 'Projects';
  String selectedProjectId='';
  int paddingValue = 0;
  Key key=GlobalKey();
  String lastProjectId='';
  String selectedSolution = '';
  int minimumCountINSolution = 1;
  int maximumCountINSolution = 1;
  int selectedCountINSolution = 1;
  final HomePageService _service = HomePageService();
  List<String> imageURL = [];
  List<String> projectButton = ['Ctr', 'Oracel', 'Mtn'];
  List<String> followUsButton = [
    'Facebook',
    'LinkedIn',
    'Instagram',
    'Twitter',
  ];
  List<String> aboutAs = [
    'Our Company',
    'Careers',
    'Contact Us',
    'Privacy Policy'
  ];
  List<String> solutionsButton = [
    'Finance',
    'agriculture',
    'Aviation',
    'Banking',
    'Correction',
    'Education',
    'Energy',
    'Environmental',
    'Casino Game',
    'Construction',
  ];

  HomePageProvider();

  void backwardForward(bool backward) {
    if (backward && selectedCountINSolution>1) {
      selectedCountINSolution--;
      if ( selectedCountINSolution % 5 == 1) {
        changeMinimumCountINSolution(false);
      }
    } else if (!backward &&selectedCountINSolution<maximumCountINSolution ) {
      selectedCountINSolution++;
      if(selectedCountINSolution % 5 == 4) {
        changeMinimumCountINSolution(true);
      }
      } else {
        return;
      }
    notifyListeners();
  }

  void changeSolutionPage(int number) {
    selectedCountINSolution = number;
    notifyListeners();
  }

  void loadSocialMediaImage() async {
    List<Reference> res = await _service.getAllSocialMediaImage();
    for (Reference ref in res) {
      imageURL.add(await ref.getDownloadURL());
      notifyListeners();
    }
  }

  void navigateToAnotherPage(String newPageName) {
    pageName = newPageName;
    switch (newPageName) {
      case 'Projects':
        paddingValue = 0;
        body=const Projects();
        break;

      case 'Solutions':
        paddingValue = 1;
        body = const Solutions();
        break;

      case 'About us':
        {
          paddingValue = 2;
          body = const AboutUs();
          break;
        }

      case 'Contact us ':
        {
          paddingValue = 3;
          body = const ContactUs();
          break;
        }
      default:
        break;
    }
    notifyListeners();
  }

  void changeSolutionOption(String name) {
    selectedSolution = name;
    notifyListeners();
  }

  void changeMaximumCountINSolution(int number) {
    maximumCountINSolution = number > 0 ? (number / 10).ceil() : 1;
  }

  void changeMinimumCountINSolution(bool increase) {
    if (increase) {
      minimumCountINSolution =
      minimumCountINSolution + 5 > maximumCountINSolution
          ? minimumCountINSolution
          : minimumCountINSolution + 5;
    } else {
      if (minimumCountINSolution - 5 > 0) {
        minimumCountINSolution -= 5;
      }
    }
    notifyListeners();
  }

  void changeSelectedProject(String projectID){
    selectedProjectId=projectID;
    print(projectID);
    notifyListeners();
  }
  void setLastProjectId(String lastID){
    lastProjectId=lastID;
  }


}
