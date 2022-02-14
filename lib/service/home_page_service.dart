import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomePageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  late final Reference _socialMediaImageReference;
  late final DatabaseReference _contactUsReference;
  late final DatabaseReference _solutionsReference;
  late final DatabaseReference _solutionsIcons;
  late final DatabaseReference _projectDataRef;
  HomePageService() {
    _socialMediaImageReference = _firebaseStorage.ref('socialMediaPhoto');
    _contactUsReference = _database.ref('ourInfo/contactUs');
    _solutionsReference = _database.ref('solutionsData');
    _solutionsIcons = _database.ref('solutionsData/solutions');
    _projectDataRef = _database.ref('projectsData');
  }



  Future<List<Reference>> getAllSocialMediaImage() async {
    return await _socialMediaImageReference.listAll().then((value) async {
      return value.items;
    });
  }

  Future<Map<String, dynamic>?> getContactUsInfo() async {
    return await _contactUsReference
        .get()
        .then((value) => value.value as Map<String, dynamic>?);
  }

  Future<List<String>?> getAllSolutionsIcons() {
    return _solutionsIcons.get().then((result) {
      if (result.exists && result.value != null) {
        return (result.value as Map<String, dynamic>).keys.toList();
      }
    });
  }

  Future<Map<String, dynamic>?> getSolutionsData() {
    return _solutionsReference
        .get()
        .then((value) => value.value as Map<String, dynamic>?);
  }

  Future<Map<String, dynamic>?> getProjectsData() {
    return _projectDataRef.get().then((value) {
      return value.value as Map<String, dynamic>?;
    });
  }
}
