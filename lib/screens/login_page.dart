import 'package:firebase_capac/authenticationService.dart';
import 'package:firebase_capac/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  AuthenticationService _auth = AuthenticationService.getInstance();
  String email, password;

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
                'TELA DE LOGIN',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: kTextFieldDecoration.copyWith(hintText: 'E-mail'),
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 10.0),
            TextField(
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(hintText: 'Senha'),
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 10.0),
            Center(
              child: FloatingActionButton.extended(
                backgroundColor: Color(0xFFAF2A900),
                onPressed: () async {
                  await _auth.logar(email, password)
                  .then((logado) {
                    if (logado) {
                      Navigator.pushReplacementNamed(context, "bd_page");
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("\tLogin Incorreto"),
                            content: Text("\tVerifique seu usuário e senha.")
                          );
                        }
                      );
                    }
                  });
                },
                label: Text('Login', style: TextStyle(color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
