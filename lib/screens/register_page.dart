import 'package:firebase_capac/constants.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'TELA DE REGISTRO',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: kTextFieldDecoration.copyWith(hintText: 'E-mail'),
              onChanged: (value) {},
            ),
            SizedBox(height: 10.0),
            TextField(
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(hintText: 'Senha'),
              onChanged: (value) {},
            ),
            SizedBox(height: 10.0),
            Center(
              child: FloatingActionButton.extended(
                backgroundColor: Color(0xFFF2A900),
                onPressed: () {
                  //TODO:
                  Navigator.pushReplacementNamed(context, 'login_page');
                },
                label: Text(
                  'Registrar',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
