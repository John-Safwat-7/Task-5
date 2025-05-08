import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sec/add_item_screen.dart';
import 'package:sec/item.dart';
import 'package:sec/item_model.dart';
import 'package:sec/main.dart';
import 'package:sec/profile_page.dart';
import 'package:sec/user_model.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final profileimage = Provider.of<UserModel>(
      context,
    ).user?.image;
    final items = Provider.of<ItemModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              icon: profileimage == null
                  ? Icon(Icons.account_box)
                  : ClipOval(
                      child: Image.file(
                        profileimage,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ))
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10),
            itemCount:items.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {


            items.selectItem(Item(body:items.items[index]. body, favorite: items.items[index].favorite, images:items.items[index]. images, title:items.items[index]. title));




              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddItemScreen()));
            },
            child: SizedBox(
              child: Column(children: [
                Image.file(items.items[index].images.first,height: 125,width: 200,fit: BoxFit.cover,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(items.items[index].title),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.favorite))
                  ],
                ),
              ]),
            ),
          );
        },
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddItemScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
