import 'package:flutter/material.dart';
import 'package:movie_app_indvidual/features/bookmark/data/repo/sql_provider.dart';
import 'package:provider/provider.dart';
import '../manager/bookmark_provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});


  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(
                            text: "Bookmark",
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
                        Icon(
                          Icons.bookmark_outlined,
                          color: Theme.of(context).colorScheme.surface,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: SQLProvider.instance.getAllMovies(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                "Error ${snapshot.error}",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            );
                          }
                          if (snapshot.hasData) {
                            return GridView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: (MediaQuery.sizeOf(context).width * 0.4) / 338,
                                ),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Column(
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
                                          child: Image.network(
                                            snapshot.data![index].image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                });
                                                SQLProvider.instance.delete(
                                                  snapshot.data![index].id,
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.close,
                                                size: 30,
                                                color: Colors.red,
                                              )),
                                        )
                                      ]),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        snapshot.data![index].title,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
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
                                            snapshot.data![index].rating,
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
                                  );
                                });
                          }

                          return const Center(
                              child: CircularProgressIndicator());
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
