import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sec/main.dart';

// ignore: must_be_immutable
class Firstscreen extends StatefulWidget {
  Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<Firstscreen> {


ImagePicker imagepicker =ImagePicker();
List < File>? selectedImage=[];
Future<void> imageSelector() async{
  List<XFile> images = await imagepicker.pickMultiImage();

  if(images != null && mounted){
    setState(() {
      selectedImage !.addAll(images.map((toElement) =>File(toElement!.path) ).toList());
      // selectedImage=File(image!.path);
    });
  }
}












  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    body.dispose();
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(

          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets\fall_tree.jpg")
           )),
          child: ListView(
            children: [
              const SizedBox(height: 30,
              ),

              selectedImage!.isEmpty?       Container(
                
                color: Colors.white30,
                height: 150, width: MediaQuery.sizeOf(context).width-20,
                
                
                
                child: IconButton( onPressed: (){
                  imageSelector();


                } ,icon: Icon(Icons.camera_alt)), )
                : Row(
                  children: [

                      Container(
                
                color: Colors.white30,
                height: 100, width: 100,
                
                
                
                child: IconButton( onPressed: (){
                  imageSelector();


                } ,icon: Icon(Icons.camera_alt)), ),




                    SizedBox(
                      height: 100,
                      width: MediaQuery.sizeOf(context).width-120,

                      child: ListView(
                        scrollDirection:  Axis.horizontal,
                        
                        children: selectedImage!.map((toElement) => Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: Image.file(toElement, height: 100, width: 100,fit: BoxFit.cover,),
                            ),
                            IconButton(onPressed: (){
                              setState(() {
                      selectedImage!.removeAt(selectedImage!.indexOf(toElement));
                    });
                            }, icon: Icon(Icons.cancel))
                          ],
                        )).toList(),),
                    ),
                  ],
                ),


















              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  minLines: 3,
                  maxLines: 7,
                  controller: title,
                  decoration: const InputDecoration(
                      hintText: "title", border: OutlineInputBorder()),
                ),
              ),
              TextField(
                minLines: 3,
                maxLines: 7,
                controller: body,
                decoration: const InputDecoration(
                    hintText: "body", border: OutlineInputBorder()),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            title: title.text,
                            body: body.text,
                            image: selectedImage,
                          )));
            }));
  }
}