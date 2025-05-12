




class Quote{


String quote;
String author;
String category;


Quote({required this.author,required this.category,required this.quote});


factory Quote.fromJson(Map<String,dynamic > json){










  return  Quote(author: json["author"], category: json["category"], quote: json["author"]);
}







}