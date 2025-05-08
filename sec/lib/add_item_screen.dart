import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sec/dashboard_screen.dart';
import 'package:sec/item.dart';
import 'package:sec/item_model.dart';
import 'package:sec/main.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddItemScreen extends StatefulWidget {
  AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<AddItemScreen> {
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
                  image: AssetImage("assets\fall_tree.jpg"))),
          child: Consumer<ItemModel>(
            builder: (context, itemModel, child) => ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                itemModel.selectedImage!.isEmpty
                    ? Container(
                        color: Colors.white30,
                        height: 150,
                        width: MediaQuery.sizeOf(context).width - 20,
                        child: IconButton(
                            onPressed: () {
                              itemModel.imageSelector();
                            },
                            icon: Icon(Icons.camera_alt)),
                      )
                    : Row(
                        children: [
                          Container(
                            color: Colors.white30,
                            height: 100,
                            width: 100,
                            child: IconButton(
                                onPressed: () {
                                  itemModel.imageSelector();
                                },
                                icon: Icon(Icons.camera_alt)),
                          ),
                          SizedBox(
                            height: 100,
                            width: MediaQuery.sizeOf(context).width - 120,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: itemModel.selectedImage!
                                  .map((toElement) => Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Image.file(
                                              toElement,
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                itemModel.removeImage(itemModel
                                                    .selectedImage!
                                                    .indexOf(toElement));
                                              },
                                              icon: Icon(Icons.cancel))
                                        ],
                                      ))
                                  .toList(),
                            ),
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
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () {
              final item = Provider.of<ItemModel>(context, listen: false);
              item.addItem(Item(
                  body: body.text,
                  favorite: false,
                  images: List.from(item.selectedImage!),
                  title: title.text));
              item.selectedImage!.clear();

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            }));
  }
}
