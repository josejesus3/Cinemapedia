import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CostomBottonNavigatorBar extends StatelessWidget {
  final int currentIndex;
  const CostomBottonNavigatorBar({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) => onItemTapped(context, value),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.label_outline), label: 'Categorias'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos')
        ]);
  }
}
