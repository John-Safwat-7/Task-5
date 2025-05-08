import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sec/options.dart';
import 'package:provider/provider.dart';
import 'package:sec/user_model.dart';


class ProfilePage extends StatefulWidget {
   ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Consumer <UserModel>(
          builder: (context, userModel, child) 
          {
          return  Stack(
            alignment: Alignment.center,
            children: [
               CircleAvatar(
                radius: 100,
                child: userModel.user?.image==null?
          
                
                Icon(Icons.person, size: 100):
                ClipOval(child: Image.file(
                  height: 200,
                  width: 200,
                  fit:BoxFit.cover,
                  userModel.user!.image!))
          
          
          
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 25,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, size: 20),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return  SizedBox(
                            height: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ProfileOption(
                                  onPressed: (){
          
                                    userModel. imageSelector(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                  title: 'Camera',
                                  icon: Icons.camera_alt,
                                ),
                                ProfileOption(
                                  onPressed: (){
                                    userModel. imageSelector(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                  title: 'Gallery',
                                  icon: Icons.photo,
                                ),
                                if(userModel.user?.image !=null)
                                ProfileOption(
                                  selsectedImage: userModel.user?.image,
                                  onPressed: (){
                                       userModel.removeImage();
                                          Navigator.pop(context);
                                  },
                                  title: 'Delete',
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
          }
        ),
      ),
    );
  }
}

