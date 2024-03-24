import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CostomBottonNavigatorBar extends StatelessWidget {
  const CostomBottonNavigatorBar({super.key});

  void onPressed(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/');
        break;
      case 2:
        context.go('/Favorites');
        break;
    }
  }

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case '/':
        return 0;
      case '/Categoris':
        return 1;
      case '/Favorites':
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) => onPressed(context, value),
        currentIndex: getCurrentIndex(context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.label_outline), label: 'Categorias'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos')
        ]);
  }
}
