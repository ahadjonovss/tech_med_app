class Product{
  String name;
  String description;
  int price;
  String main_image;
  List<String> images=[];

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.main_image
    });
}