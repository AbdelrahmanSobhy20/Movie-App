import 'dart:convert';

class MovieModelDetails{
  int? generalId;
  late int rank;
  late String title;
  late String rating;
  late String id;
  late int year;
  late String image;
  late String big_image;
  late String description;
  late String trailer;
  late String trailer_embed_link;
  late String trailer_youtube_id;
  late List genre;
  late List director;
  late List writers;

  MovieModelDetails({
    this.generalId,
    required this.rank,
    required this.title,
    required this.rating,
    required this.id,
    required this.year,
    required this.image,
    required this.big_image,
    required this.description,
    required this.trailer,
    required this.trailer_embed_link,
    required this.trailer_youtube_id,
    required this.genre,
    required this.director,
    required this.writers
});
  MovieModelDetails.fromJson(Map<String , dynamic> json){
    generalId= json['generalId'];
    rank = json['rank'];
    title = json['title'];
    rating = json['rating'];
    id = json['id'];
    year = json['year'];
    image = json['image'];
    big_image = json['big_image'];
    description = json['description'];
    trailer = json['trailer'];
    trailer_embed_link = json['trailer_embed_link'];
    trailer_youtube_id = json['trailer_youtube_id'];
    genre = json['genre'];
    director = json['director'];
    writers = json['writers'];
  }

  Map<String, dynamic> toJson() {
    return {
      "rank": rank,
      "title":title,
      "rating": rating,
      "id": id,
      "year": year,
      "image": image,
      "big_image": big_image,
      "description": description,
      "trailer": trailer,
      "trailer_embed_link": trailer_embed_link,
      "trailer_youtube_id":trailer_youtube_id,
      "genre": jsonEncode(genre),
      "director": jsonEncode(director),
      "writers": jsonEncode(writers),
    };
  }
}