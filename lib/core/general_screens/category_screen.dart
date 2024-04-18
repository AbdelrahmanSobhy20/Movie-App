import 'package:flutter/material.dart';
import 'package:movie_app_indvidual/features/home/data/repo/home_repo.dart';
import '../../features/home/data/models/movie_model.dart';
import 'category_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});
  final String category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<MovieModel>> categoryMovies;
  @override
  void initState() {
    categoryMovies= HomeRepo().getMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Theme.of(context).colorScheme.surface,
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      Text.rich(TextSpan(
                          text: '${widget.category} Category',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          children: [
                            TextSpan(
                              text: ".",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            )
                          ])),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: categoryMovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                "Error ${snapshot.error}",
                                style: TextStyle(
                                  color:Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            );
                          }
                          if (snapshot.hasData) {
                            return CategoryCard(allMovies: snapshot.data!, categoryType: widget.category,);
                          }
                          return const Center(child: CircularProgressIndicator());
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),


      ),
    );
  }
}
