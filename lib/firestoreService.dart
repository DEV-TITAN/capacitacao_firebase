import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static FirestoreService _instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  int count;

  FirestoreService._internal();

  static FirestoreService getInstance() {
    if (_instance == null) {
      _instance = FirestoreService._internal();
    }
    return _instance;
  }

  Future<void> criarRegistro () async {
    await db.collection("users")
      .add({
        "name": "Guihlerme",
        "age": 24,
        "email": "guilhermeedintgon@gmail.com"
      }).then((value){
        print(value.id);
      }).catchError((e) => print(e));
  }

  Future<void> criarRegistroNumerico () async {
    if (count == null) {
      count = 0;
    }
    Map<String,dynamic> valor = {
      "name": "Avatar",
      "age": 21,
      "email": "avatarhetero@gmail.com"
    };
    await db.collection("users")
    .doc(count.toString()).set(valor)
    .then((value){
      count++;
    });  
  }

  Future<void> atualizarRegistro(String doc) async {
    Map<String,dynamic> valor = {
      "name": "Guilherme Edington"
    };
    await db.collection("users").doc(doc).update(valor);
  }

  Future<void> deletarRegistro(String doc) async {
    await db.collection("users").doc(doc).delete();
  }

}