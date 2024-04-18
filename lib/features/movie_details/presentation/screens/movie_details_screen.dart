import 'package:flutter/material.dart';
import 'package:movie_app_indvidual/features/bookmark/data/models/sql_model.dart';
import 'package:movie_app_indvidual/features/bookmark/data/repo/sql_provider.dart';
import 'package:movie_app_indvidual/features/movie_details/data/models/movie_model_details.dart';
import 'package:movie_app_indvidual/features/movie_details/data/repo/details_repo.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:provider/provider.dart';

import '../../../bookmark/presentation/manager/bookmark_provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key,
    required this.id,
    required this.title,
    required this.bigImage,
    required this.rating,
    required this.year,
    required this.image});

  final String id;
  final String title;
  final String bigImage;
  final String image;
  final String rating;
  final String year;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<MovieModelDetails> movieDetails;
  late YoutubePlayerController _controller;
  ScrollController? scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    movieDetails = DetailsRepo().getMovies(widget.id);
  }

  @override
  void dispose() {
    _controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isBooked = false;
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        slivers: [
          Consumer<BookmarkProvider>(
            builder: (BuildContext context, BookmarkProvider bookmarkProvider,
                Widget? child) {
              return SliverAppBar(
                expandedHeight: 700,
                pinned: true,
                stretch: true,
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: SizedBox(
                    width: 300,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondary,
                      ),
                    ),
                  ),
                  background: Image.network(
                    widget.bigImage,
                    fit: BoxFit.cover,
                  ),
                ),
                backgroundColor: Theme
                    .of(context)
                    .colorScheme
                    .background,
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .surface,
                    )),
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (isBooked == false) {
                            bookmarkProvider.isSelected =false;
                            bookmarkProvider.selectedMovie(widget.id);
                            SQLProvider.instance.insert(SQLModel(
                                title: widget.title,
                                image: widget.image,
                                rating: widget.rating,
                                id: widget.id,
                                bigImage: widget.bigImage,
                                year: int.parse(widget.year)));
                            isBooked=true;
                            bookmarkProvider.isSelected =true;
                          } else if(isBooked == true){
                            bookmarkProvider.isSelected =true;
                            bookmarkProvider.selectedMovie(widget.id);
                            SQLProvider.instance.delete(widget.id);
                            isBooked =false;
                            bookmarkProvider.isSelected =false;
                          }
                        });

                      },
                      icon: Icon(bookmarkProvider.bookmark,
                        size: 40,))
                ],
              );
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FutureBuilder<MovieModelDetails>(
                    future: movieDetails,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error ${snapshot.error}",
                            style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .secondary,
                            ),
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        _controller = YoutubePlayerController(
                            initialVideoId: snapshot.data!.trailer_youtube_id,
                            flags: const YoutubePlayerFlags(
                              mute: false,
                              forceHD: true,
                              loop: false,
                              autoPlay: false,
                            ));
                        return SizedBox(
                          height: MediaQuery
                              .sizeOf(context)
                              .height,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(TextSpan(
                                      text: "Year:",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: snapshot.data!.year.toString(),
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Theme
                                                .of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                        )
                                      ])),
                                  Text.rich(TextSpan(
                                      text: "Rank:",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: snapshot.data!.rank.toString(),
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Theme
                                                .of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                        )
                                      ])),
                                  Row(
                                    children: [
                                      Text.rich(TextSpan(
                                          text: "Rate:",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Theme
                                                .of(context)
                                                .colorScheme
                                                .surface,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: snapshot.data!.rating
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Theme
                                                    .of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                            )
                                          ])),
                                      Icon(
                                        Icons.star_rounded,
                                        size: 25,
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .surface,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .surface,
                                ),
                              ),
                              Text(
                                snapshot.data!.description,
                                style: TextStyle(
                                  fontSize: 20,
                                  color:
                                  Theme
                                      .of(context)
                                      .colorScheme
                                      .secondary,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Trailer",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .surface,
                                ),
                              ),
                              YoutubePlayerBuilder(
                                player: YoutubePlayer(
                                  controller: _controller,
                                ),
                                builder: (context, player) {
                                  return YoutubePlayer(controller: _controller);
                                },
                              ),
                              Text(
                                "Directed By:",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .surface,
                                ),
                              ),
                              Text(
                                snapshot.data!.director[0],
                                style: TextStyle(
                                  fontSize: 30,
                                  color:
                                  Theme
                                      .of(context)
                                      .colorScheme
                                      .secondary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
