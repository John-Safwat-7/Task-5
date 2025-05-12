import 'package:flutter/material.dart';
import 'package:sec/favorite_model.dart';
import 'package:sec/item_model.dart';
import 'package:provider/provider.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({required this.index,super.key});

  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(
      builder: (context,item,child){
        final fav =Provider.of<FavoriteModel>(context,listen: true);
        final currentItem =item.items[index];
       return IconButton(
        onPressed: () {

          fav.isFavorite(currentItem);


         
        },
        icon: Icon(Icons.favorite, color: item.items[index].favorite ? Colors.red : Colors.grey),
      
      );
      }
    );
  
  }
}