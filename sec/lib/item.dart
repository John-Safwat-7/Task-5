import 'dart:io';

class Item {
  List<File> images;
  String title;
  String body;
  bool favorite;

  @override
  bool operator==(Object other){
    return other is Item && other.title==title;
  }
  @override
  int get hashCode=>title.hashCode;


  Item({required this.body,required this.favorite,required this.images,required this.title});
}