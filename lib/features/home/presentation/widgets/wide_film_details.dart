import 'package:flutter/material.dart';

import '../../data/models/movie_model.dart';

class WideFilmDetails extends StatelessWidget {
  const WideFilmDetails({
    super.key,
    required this.movieList,
  });
  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xff424242),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      movieList[index].image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  movieList[index].title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      movieList[index].rating.isEmpty
                          ? "None"
                          : movieList[index].rating,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 24,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
