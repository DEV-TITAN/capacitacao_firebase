import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_capac/firestoreService.dart';
import 'package:flutter/material.dart';

class BdPage extends StatefulWidget {
  @override
  _BdPageState createState() => _BdPageState();
}

class _BdPageState extends State<BdPage> {
  FirestoreService firestore = FirestoreService.getInstance();

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshots) {
    print("Carregando registros...");
    return ListView(
      children: snapshots.map((data) => buildListItem(context,data)).toList(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
    );
  }

  Widget buildListItem(BuildContext context, DocumentSnapshot doc){
    return Card(
      child: ListTile(
        title: Text(doc["name"]),
        subtitle: Text(doc["email"]),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TITAN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        actions: [
          Center(
            child: FlatButton(
              child: Text(
                'Storage',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'storage_page');
              },
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.db.collection("users")
                .orderBy("age",descending: true)
                .snapshots(),
                builder: (BuildContext context, snapshots) {
                  if (!snapshots.hasData) {
                    return Text("Aguarde...");
                  }
                  return buildList(context,snapshots.data.docs);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFF2A900),
        onPressed: () async {
          //await firestore.criarRegistro();
          await firestore.criarRegistroNumerico();
          //await firestore.atualizarRegistro("zJhxJmY3DJKbBCok7Mlt");
          //await firestore.deletarRegistro("1");
        },
        label: Text(
          "Gerar",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
