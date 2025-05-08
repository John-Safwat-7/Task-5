



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sec/item.dart';

class ItemModel extends ChangeNotifier{

final List<Item> _items=[];
List<Item> get items=>_items;

void addItem (Item item){
  _items.add(item);

  notifyListeners();
}











ImagePicker imagepicker =ImagePicker();
List < File>? selectedImage=[];
Future<void> imageSelector() async{
  List<XFile> images = await imagepicker.pickMultiImage();

  if(images != null){
    
      selectedImage !.addAll(images.map((toElement) =>File(toElement!.path) ).toList());
      // selectedImage=File(image!.path);
   
  }

notifyListeners();

}

void removeImage(index){
   
 selectedImage!.removeAt(index);
 

 notifyListeners();
                  
}

Item? _selectedItem;
Item? get selectedItem =>_selectedItem;
void selectItem (Item item)
{
  _selectedItem=item;
  notifyListeners();
}



}