import 'package:flutter/material.dart';
import 'package:movie_app_indvidual/features/movie_details/presentation/screens/movie_details_screen.dart';
import '../../data/models/movie_model.dart';

class HighFilmDetails extends StatelessWidget {
  const HighFilmDetails({
    super.key,
    required this.movieList,
  });

  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Container(
                  height: 273,
                  width: 182,
                  decoration: BoxDecoration(
                    color: const Color(0xff424242),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                                  id: movieList[index].id,
                                  title: movieList[index].title,
                                  bigImage: movieList[index].bigImage,
                                  rating: movieList[index].rating,
                                  year: movieList[index].year.toString(),
                                  image: movieList[index].image,
                                )));
                      },
                      child: Image.network(
                        movieList[index].image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieList[index].title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          maxLines: 2,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
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
                                color:Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            Icon(
                              Icons.star_rounded,
                              size: 24,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Year : ${movieList[index].year}",
                          style: TextStyle(
                              fontSize: 16, color:Theme.of(context).colorScheme.secondary,),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
