

import 'package:firebase_storage/firebase_storage.dart';

class WelcomePageService {
  final FirebaseStorage _firebaseStorge = FirebaseStorage.instance;
  late final Reference _imageReference = _firebaseStorge.ref('welcomPagePhoto');

 Future<List<Reference>> getAllImage() async {
     return await _imageReference.listAll().then((value)async  {
        return value.items;
    });
  }
}
