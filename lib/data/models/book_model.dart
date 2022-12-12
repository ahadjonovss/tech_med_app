class Book {
  Book({
    required this.categoryId,
    required this.productId,
    required this.name,
    required this.author,
    required this.price,
    required this.dateOfPublish,
    required this.description,
    required this.mainImage,
    required this.images,
    required this.bought,
    required this.rates,
    required this.category,
    required this.count,
  });

  String name;
  String categoryId;
  String productId;
  String author;
  String price;
  String dateOfPublish;
  String description;
  String mainImage;
  List<String> images;
  int bought;
  List<int> rates;
  String category;
  int count;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
      name: json["name"]??"no name",
      author: json["author"]??"no data",
      price: json["price"]??"0",
      dateOfPublish: json["dateOfPublish"]??"no data",
      description: json["description"]??"no data",
      mainImage: json["mainImage"]??"no data",
      images: List<String>.from(json["images"]??[].map((x) => x)),
      bought: json["bought"]??0,
      rates: List<int>.from(json["rates"]??[].map((x) => x)),
      category: json["category"]??"no data",
      count: json["count"]??0,
      categoryId: json["categoryId"]??"",
      productId: json["productId"]??""
  );

  Map<String, dynamic> toJson() => {
    "productId":productId,
    "categoryId":categoryId,
    "name": name,
    "author": author,
    "price": price,
    "dateOfPublish": dateOfPublish,
    "description": description,
    "mainImage": mainImage,
    "images": List<String>.from(images.map((x) => x)),
    "bought": bought,
    "rates": List<int>.from(rates.map((x) => x)),
    "category": category,
    "count": count,
  };
}