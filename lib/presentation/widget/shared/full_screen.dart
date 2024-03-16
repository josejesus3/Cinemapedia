
import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key});
  Stream<String> getLoandingMessage() {
    final message = <String>[
      'Cargando peliculas',
      'Prepara tus palomitas',
      'Cargando Populares',
      'Prepara lo necesario',
      'Pronto comenzara'
    ];
    return Stream.periodic(
      const Duration(milliseconds: 1200),
      (step) {
        return message[step];
      },
    ).take(message.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Espere Porfavor'),
        const SizedBox(
          height: 10,
        ),
        const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
          stream: getLoandingMessage(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Cargando...');
    
            return Text(snapshot.data!);
          },
        )
      ],
    ));
  }
}
