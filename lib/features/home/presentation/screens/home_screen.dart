import 'package:flutter/material.dart';
import 'package:movie_app_indvidual/features/discover/presentation/screens/dicover_screen.dart';
import 'package:movie_app_indvidual/features/home/presentation/manager/home_provider.dart';
import 'package:movie_app_indvidual/features/home/presentation/manager/movies_provider.dart';
import 'package:movie_app_indvidual/features/home/presentation/widgets/high_film_details.dart';
import 'package:provider/provider.dart';
import '../../../../core/general_screens/category_screen.dart';
import '../widgets/category_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MoviesProvider>(context, listen: false).fetchMovies(context);
  }

  bool isAfterNoon() {
    DateTime now = DateTime.now();
    print(now.hour);
    return now.hour >= 12;
  }

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MoviesProvider>(context, listen: false)
        .movies;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text.rich(TextSpan(
                  //   text: isAfterNoon() ? "Good Evening 😊" : "Good Morning 😊",
                  //   style: TextStyle(
                  //     color: Theme.of(context).colorScheme.secondary,
                  //   ),
                  //   children: [
                  //     TextSpan(
                  //       text: "ahmed",
                  //       style: TextStyle(
                  //         color: Theme.of(context).colorScheme.secondary,
                  //         fontSize: 18
                  //       ),
                  //     )
                  //   ]
                  // )),
                  Text(
                    isAfterNoon() ? "Good Evening 😊" : "Good Morning 😊",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  // Text(
                  //   "Good Evening ahmed!",
                  //   style: TextStyle(
                  //     color: Theme.of(context).colorScheme.secondary,
                  //   ),
                  // ),
                  Text(
                    "Let's Enjoy!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    Provider.of<HomeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                  icon: Provider.of<HomeProvider>(context, listen: false).mode)
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 4,
            ),
            Text.rich(TextSpan(
                text: "Categories",
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
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryScreen(
                              category: 'Action',
                            )));
                  },
                  child: const CategoryType(
                    image: 'assets/result.png',
                    categoryName: 'Action',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryScreen(
                              category: 'Crime',
                            )));
                  },
                  child: const CategoryType(
                    image: 'assets/result.png',
                    categoryName: 'Crime',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryScreen(
                              category: 'Comedy',
                            )));
                  },
                  child: const CategoryType(
                    image: 'assets/result.png',
                    categoryName: 'Comedy',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryScreen(
                              category: 'Romance',
                            )));
                  },
                  child: const CategoryType(
                    image: 'assets/result.png',
                    categoryName: 'Romance',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryScreen(
                              category: 'Biography',
                            )));
                  },
                  child: const CategoryType(
                    image: 'assets/result.png',
                    categoryName: 'Biography',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryScreen(
                              category: 'History',
                            )));
                  },
                  child: const CategoryType(
                    image: 'assets/result.png',
                    categoryName: 'History',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryScreen(
                              category: 'Sci-Fi',
                            )));
                  },
                  child: const CategoryType(
                    image: 'assets/result.png',
                    categoryName: 'Sci-Fi',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryScreen(
                              category: 'Family',
                            )));
                  },
                  child: const CategoryType(
                    image: 'assets/result.png',
                    categoryName: 'Family',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: "Top Five",
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
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DiscoverScreen()));
                    },
                    child: Text(
                      "SEE MORE",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            movies != null
                ? HighFilmDetails(movieList: movies)
                : Provider.of<MoviesProvider>(context).isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: Text(
                        "NO MOVIES YET",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
