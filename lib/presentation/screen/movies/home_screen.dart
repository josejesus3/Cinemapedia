import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'Home-Screen';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(Environment.movieDbKey)),
    );
  }
}
