import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_shop_app/components/local_data/database.dart';
import 'package:tech_shop_app/components/widgets/edited_widgets/mediaQuarees.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {

    dynamic check_fav(){
      bool isHas=false;
      for(var i in all_product){
        for (var j in i){

        }
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Container(
          height: m_h(context),
          width: m_w(context),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
