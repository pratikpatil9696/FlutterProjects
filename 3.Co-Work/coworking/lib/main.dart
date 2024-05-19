import 'package:coworking/View/desk.dart';
import 'package:coworking/View/booking.dart';
import 'package:coworking/View/create_an_account.dart';
import 'package:coworking/View/avaible_desk.dart';
import 'package:coworking/View/home.dart';
import 'package:flutter/material.dart';

import 'package:coworking/View/login.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CreateAnAccount(),
      debugShowCheckedModeBanner: false,
      routes: {
        'Login': (context) => const Login(),
        'Home': (context) => const Home(),
        'CreateAnAccount': (context) => const CreateAnAccount(),
        'Booking': (context) => const Booking(),
        'AvaliableDesk': (context) => const AvaliableDesk(),
        'Desk': (context) => const Desk(),
      },
    );
  }
}
