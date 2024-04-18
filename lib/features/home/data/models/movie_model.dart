import 'dart:convert';

class MovieModel{
  late int rank;
  late String title;
  late String description;
  late String image;
  late String bigImage;
  late List genre;
  late String thumbnail;
  late String rating;
  late String id;
  late int year;
  late String imdbId;
  late String imdbLink;

  MovieModel({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.bigImage,
    required this.genre,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.imdbId,
    // required this.imdbLink
});

  MovieModel.fromJson(Map<String, dynamic> json) {
    rank = int.parse(json['rank'].toString());
    title = json['title'];
    description = json['description'];
    image = json['image'];
    bigImage = json['big_image'];
    genre = json['genre'];
    thumbnail = json['thumbnail'];
    rating = json['rating'];
    id = json['id'];
    year = int.parse(json['year'].toString());
    imdbId = json['imdbid'];
    imdbLink = json['imdb_link'];
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'title': title,
      'description': description,
      'image': image,
      'big_image': bigImage,
      'genre': jsonEncode(genre),
      'thumbnail': thumbnail,
      'rating': rating,
      'id': id,
      'year': year,
      'imdbid': imdbId,
      'imdb_link': imdbLink,
    };
  }
}