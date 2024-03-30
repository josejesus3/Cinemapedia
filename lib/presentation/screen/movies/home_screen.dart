import 'package:cinemapedia/presentation/screen/screen.dart';
import 'package:cinemapedia/presentation/views/movies/favorites_view.dart';
import 'package:cinemapedia/presentation/widget/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'Home-Screen';
  final int pageIndex;

  const HomeScreen({
    super.key,
    required this.pageIndex,
  });

  final List<Widget> viewRoutes = const [
    HomeView(),
    SizedBox(),
    FavoritesView()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar:  CostomBottonNavigatorBar(currentIndex: pageIndex ,),
    );
  }
}
