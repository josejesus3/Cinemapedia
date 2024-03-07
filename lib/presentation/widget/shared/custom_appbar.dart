import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    final textTitle = Theme.of(context).textTheme.titleLarge;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              const Icon(
                Icons.movie_outlined,
                color: Colors.blueAccent,
              ),
              const SizedBox(width: 4,),
              Text(
                'CinemaPedia',
                style: textTitle,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_rounded,size: 30,))
            ],
          ),
        ),
      ),
    );
  }
}
