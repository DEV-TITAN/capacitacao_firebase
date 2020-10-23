import 'package:flutter/material.dart';

class BdPage extends StatefulWidget {
  @override
  _BdPageState createState() => _BdPageState();
}

class _BdPageState extends State<BdPage> {
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
            Card(
              child: ListTile(
                title: Text("Nome"),
                subtitle: Text("E-mail"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFF2A900),
        onPressed: null,
        label: Text(
          "Gerar",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
