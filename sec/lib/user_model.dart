import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sec/user.dart';

class UserModel extends ChangeNotifier {
  ImagePicker imagepicker = ImagePicker();

  // File? selectedImage;

  User? _user;
  User? get user => _user;

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await imagepicker.pickImage(source: source);

    if (image != null) {
      if (_user != null) {
        _user?.image = File(image!.path);
      }
      else{
        _user=User(name: "John", bio: "blah blah ",image:File(image!.path) );
      }
      notifyListeners();
    }
  }





  void removeImage(){


 _user?.image=null;
                                    
notifyListeners();                     






  }
}
