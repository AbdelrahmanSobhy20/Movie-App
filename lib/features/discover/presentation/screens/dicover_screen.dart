import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_indvidual/features/discover/presentation/widgets/card_film.dart';
import 'package:provider/provider.dart';
import '../../../home/presentation/manager/movies_provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MoviesProvider>(context, listen: false).fetchMovies(context);
  }
  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MoviesProvider>(context, listen: false)
        .movies;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                          text: "Discover",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color:Theme.of(context).colorScheme.secondary,
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
                        width: 145,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.bookmark_outlined,
                            color: Theme.of(context).colorScheme.surface,
                            size: 35,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: movies != null
                        ? CardFilm(allMovies: movies)
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
