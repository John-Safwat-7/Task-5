import 'dart:io';

class Item {
  List<File> images;
  String title;
  String body;
  bool favorite;
  Item({required this.body,required this.favorite,required this.images,required this.title});
}