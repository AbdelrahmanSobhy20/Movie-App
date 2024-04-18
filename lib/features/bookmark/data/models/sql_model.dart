class SQLModel {
  int? generalId;
  late String title;
  late String image;
  late String bigImage;
  late String rating;
  late int year;
  late String id;

  SQLModel({
    this.generalId,
    required this.title,
    required this.image,
    required this.bigImage,
    required this.year,
    required this.rating,
    required this.id,
  });

  SQLModel.fromMap(Map<String, dynamic> map) {
    generalId = map['generalId'];
    title = map['title'];
    image = map['image'];
    bigImage = map['big_image'];
    year = map['year'];
    rating = map['rating'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (generalId != null) {
      map["generalId"] = generalId;
    }
    map['title'] = title;
    map['image'] = image;
    map['big_image'] = bigImage;
    map['year'] = year;
    map['rating'] = rating;
    map['id'] = id;

    return map;
  }
}
