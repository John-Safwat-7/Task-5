import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:sec/add_item_screen.dart';
import 'package:sec/dashboard_screen.dart';
import 'package:sec/item_model.dart';
import 'package:sec/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:sec/user_model.dart';


void main() {
  runApp(
MultiProvider(
  providers: [ChangeNotifierProvider(create: (context)=>UserModel(),),
  ChangeNotifierProvider(create: (context)=>ItemModel(),)
  ],
  child: const MyApp()
));
    
  

    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


      

    return MaterialApp(
      title: 'Tree Info',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: DashboardScreen(),
    );
  }
}

class DetailsPage extends StatelessWidget {
  // final String title;
  // final String body;
  // final List <File> ? image; 

   const DetailsPage({
  //this.image , required this.title,required this.body,
  super.key});
  @override
  Widget build(BuildContext context) {
    final profileimage = Provider.of<UserModel>(context, ).user?.image;
    final items = Provider.of<ItemModel>(context);
    return Scaffold(
        appBar: AppBar(



          actions: [IconButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));


          }, icon: profileimage ==null?Icon(Icons.account_box):ClipOval(child: Image.file(profileimage,
          height: 50,width: 50,fit: BoxFit.cover,),))],
          
          centerTitle: true,
          title:  Text("The ${items.selectedItem!.title}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //image == null || image!.isEmpty? Image.asset("assets/tree.jpg"):
              Image.file(items.selectedItem!.images.first, height: 300,width: double.infinity,fit: BoxFit.cover,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FavoriteWidget(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                ],
              ),
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                 items.selectedItem!.body,
                  textAlign: TextAlign.justify, 
                  
          
          
          
                  ) ,  ),
              // image == null || image!.isEmpty? const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     MySeasons(text: "Spring", url: "assets/spring_tree.jpg"),
              //     MySeasons(text: "Fall", url: "assets/fall_tree.jpg"),
              //   ],
              // ):
              SizedBox(
                height: 500,
                child: GridView.builder(
                
                
                  itemCount: items.selectedItem!.images.length,
                  itemBuilder: (context, index)=> 
                  Image.file(items.selectedItem!.images[index], height: 200,width: 200,fit:BoxFit.cover,),
                
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10)),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.next_plan,
          ),
        ));
  }
}

class MySeasons extends StatelessWidget {
  final String url;
  final String text;
  const MySeasons({required this.text, required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(height: 100, width: 100, fit: BoxFit.cover, url),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 25)),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget{
  const FavoriteWidget({super.key});
  
  @override
  State<StatefulWidget> createState() => _FavoriteWidgetState();
    
}
class _FavoriteWidgetState extends State<FavoriteWidget>{

    bool click=false;


  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      setState(() {
        click=!click;
      });
    }, icon:  Icon(Icons.favorite,color: click ? Colors.red : Colors.black, ));

  }
  
}