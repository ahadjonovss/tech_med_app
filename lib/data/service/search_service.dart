import 'package:tech_shop_app/components/local_data/database.dart';
import 'package:tech_shop_app/components/models/product_model.dart';

List <Product> searchByName(String name){
  List<Product> found=[];
  for(var i in all_product){
    for(var j in i){
      if(j.title.toLowerCase().contains(name.toLowerCase())){
        found.add(j);
      }
    }
  }
  return found;
}
