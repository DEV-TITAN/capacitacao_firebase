import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class StorageService {
  static StorageService _instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  StorageService._internal();

  static StorageService getInstance() {
    if (_instance == null) {
      _instance = StorageService._internal();
    }
    return _instance;
  }

  Future<void> uploadImage(File img) async {
    Reference ref = _storage.ref().child("images").child("imagem01");
    UploadTask upload = ref.putFile(img);
    await upload;
    String url = (await ref.getDownloadURL());
    print(url);
  }

}