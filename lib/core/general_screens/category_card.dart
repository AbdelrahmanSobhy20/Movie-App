import 'package:flutter/material.dart';import 'package:movie_app_indvidual/features/movie_details/presentation/screens/movie_details_screen.dart';
import '../../features/home/data/models/movie_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.allMovies, required this.categoryType,
  });

  final List<MovieModel> allMovies;
  final String categoryType;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          childAspectRatio: (MediaQuery.sizeOf(context).width * 0.4) / 338,
        ),
        itemCount: allMovies.length,
        itemBuilder: (context, index) {
          List category = allMovies[index].genre;
          for(int i=0 ; i<category.length;i++){
            if(category[i]==categoryType){

            }
          }
          return allMovies[index].genre.contains(categoryType)?Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  height: 273,
                  width: 182,
                  decoration: BoxDecoration(
                    color: const Color(0xff424242),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(
                            id: allMovies[index].id,
                            title: allMovies[index].title,
                            bigImage: allMovies[index].bigImage,
                            rating: allMovies[index].rating,
                            year: allMovies[index].year.toString(),
                            image: allMovies[index].image,
                          )));
                    },
                    child: Image.network(
                      allMovies[index].image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 4,
              ),
              Text(
                allMovies[index].title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    allMovies[index].rating.isEmpty
                        ? "None"
                        : allMovies[index].rating,
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
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ): null;
        });
  }
}
