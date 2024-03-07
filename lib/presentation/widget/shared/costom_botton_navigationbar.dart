import 'package:flutter/material.dart';

class CostomBottonNavigatorBar extends StatelessWidget {
  const CostomBottonNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_max),
        label: 'Inicio'
      ),

      BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label:'Categorias'
          
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label:'Favoritos'
          
          )
    ]);
  }
}
