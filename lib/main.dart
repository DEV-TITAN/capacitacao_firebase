import 'package:firebase_capac/screens/bd_page.dart';
import 'package:firebase_capac/screens/login_page.dart';
import 'package:firebase_capac/screens/register_page.dart';
import 'package:firebase_capac/screens/storage_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        primaryColor: Color(0xFFF2A900),
      ),
      initialRoute: 'register_page',
      routes: {
        'register_page': (context) => RegisterPage(),
        'login_page': (context) => LoginPage(),
        'bd_page': (context) => BdPage(),
        'storage_page': (context) => StoragePage(),
      },
    );
  }
}
