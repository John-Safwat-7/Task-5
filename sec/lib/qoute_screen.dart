import 'package:flutter/material.dart';
import 'package:sec/quote.dart';
import 'package:sec/service.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late Future<List<Quote>> future;

  @override
  void initState() {
    future = fetchQuote();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/quote.jpeg"))),
        child: FutureBuilder(
            future: future,
            builder: (context, snapshot) 
             {
                if(snapshot.hasData){
              ListView.builder(
              itemCount: snapshot.data!.length,
                itemBuilder: (context, index) =>  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                        children: [
                          const SizedBox(height: 200),
                          Text(snapshot.data![index].quote),
                          Text(snapshot.data![index].author),
                          Text(snapshot.data![index].category)
                          ],
                      ),
                ),);
                  }

                  else if(snapshot.hasData){
                    return const Icon(Icons.wifi_off_rounded,color: Colors.green,size: 200,);
                  }

                  return const Center(child: SizedBox(
                    height: 100,
                    child: CircularProgressIndicator()));
                    }),),);
  }
}
