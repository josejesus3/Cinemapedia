import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helper/human_format.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListview(
      {super.key,
      required this.movies,
      this.loadNextPage,
      this.title,
      this.subTitle});

  @override
  State<MoviesHorizontalListview> createState() =>
      _MoviesHorizontalListviewState();
}

class _MoviesHorizontalListviewState extends State<MoviesHorizontalListview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          _Title(
            title: widget.title,
            subTitle: widget.subTitle,
          ),
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            itemCount: widget.movies.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _Slide(movies: widget.movies[index]);
            },
          ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movies;
  const _Slide({required this.movies});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*Imagen
            SizedBox(
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movies.posterPath,
                  fit: BoxFit.cover,
                  width: 150,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                              child:
                                  CircularProgressIndicator(strokeWidth: 2)));
                    }
                    return GestureDetector(
                      onTap: ()=>context.push('/movie/${movies.id}'),
                      child: FadeInDown(
                        child: child
                        ),
                        );
                  },
                ),
              ),
            ),
            //*Title
            SizedBox(
              width: 150,
              child: Text(
                textAlign: TextAlign.left,
                movies.title,
                maxLines: 2,
                style: textStyle.titleSmall,
              ),
            ),
            //*Rating
            Row(
              children: [
                Icon(
                  Icons.star_half_outlined,
                  color: Colors.yellow.shade800,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${movies.voteAverage}',
                  style: textStyle.bodyMedium
                      ?.copyWith(color: Colors.yellow.shade800),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(HumanFormat.number(movies.popularity),
                    style: textStyle.bodyMedium)
              ],
            )
          ],
        ));
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(children: [
        if (title != null)
          Text(
            title!,
            style: titleStyle,
          ),
        const Spacer(),
        if (subTitle != null)
          FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subTitle!))
      ]),
    );
  }
}
