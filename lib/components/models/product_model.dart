class Product{
  String title;
  String subtitle;
  String description;
  int price;
  String main_image;
  List<String> images=[];
  bool isLiked=false;
  int count=0;
  String desc_url;


  Product({
  required this.desc_url,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.images,
    required this.main_image
    });
}