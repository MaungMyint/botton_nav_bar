import 'package:flutter/material.dart';
import 'package:recycle_app/src/scanner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scanner.tp(),
    );
  }
}
