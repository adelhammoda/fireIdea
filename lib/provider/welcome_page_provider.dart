import '../service/welcome_page_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class WelcomePageProvider with ChangeNotifier {
  bool load = true;
  final WelcomePageService _service = WelcomePageService();
  List<String> imagesURL = [];

  void stopLoading() {
    load = false;
  }

  void loadImage() async {
    load = true;
    List<Reference> res = await _service.getAllImage();
    for (var element in res) {
      String? tmp = await element.getDownloadURL();
      if (!load) {
        break;
      }
      if (tmp != null) {
        imagesURL.add(tmp);
      }
      notifyListeners();
    }
  }
}
