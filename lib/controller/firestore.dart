import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FireStoreService {
  File? selectedImage;
  final CollectionReference user = FirebaseFirestore.instance.collection('users');
  final FirebaseStorage storage = FirebaseStorage.instance;

  addProPic( String? UID, File? selectedImage, String filetype) async {

    final imagePath = 'profile/pic${DateTime.now().millisecondsSinceEpoch}';
    final Reference storageReference = storage.ref().child(imagePath);

    // Specify content type as 'image/jpeg'
    final metadata = SettableMetadata(contentType: filetype);

    await storageReference.putFile(selectedImage!, metadata);
    final String imageUrl = await storageReference.getDownloadURL();

    return user.doc(UID).update({
      'timestamp': Timestamp.now(),
      'imageUrl':imageUrl
    });
  }
}
