import 'package:cinemapedia/presentation/screen/screen.dart';
import 'package:cinemapedia/presentation/widget/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'Home-Screen';
  final Widget childView;
  const HomeScreen({super.key, required this.childView});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: childView,
      bottomNavigationBar: const CostomBottonNavigatorBar(),
    );
  }
}
