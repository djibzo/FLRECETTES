import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:secret/reciepe.dart';
class ReciepeListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ReciepeListScreenState();
  }
}

class ReciepeListScreenState extends State<ReciepeListScreen>{
    final List<Reciepe> reciepes = [
    Reciepe("Yassa Poulet","Par Djibril",
    "https://senecuisine.com/wp-content/uploads/2018/08/Recette-de-Yassa-au-poulet-696x463.jpg",
    "1-Je suis un bandit.\n 2-Je suis dangereux",false,50),
    Reciepe("Pizza Facile","Par Djibril",
    "https://img.cuisineaz.com/1280x720/2018/02/28/i136025-pizza-legere.webp",
    "1-Je suis un bandit.\n 2-Je suis dangereux",false,50),
      Reciepe("Domoda","Par Djibril",
          "https://senecuisine.com/wp-content/uploads/2020/02/Domoda-dieune-150x150.jpg",
          "1-Je suis un bandit.\n 2-Je suis dangereux",false,50),
      Reciepe("Thiebou Yapp","Par Djibril",
          "https://senecuisine.com/wp-content/uploads/2014/05/thiebou-yapp-vermicelles-150x150.jpg",
          "1-Je suis un bandit.\n 2-Je suis dangereux",false,50),
      Reciepe("Mafe","Par Djibril",
          "https://senecuisine.com/wp-content/uploads/2013/12/Maf%C3%A9-150x150.jpg",
          "1-Je suis un bandit.\n 2-Je suis dangereux",false,50),
      Reciepe("Deukhine","Par Djibril",
          "https://senecuisine.com/wp-content/uploads/2018/09/Dakhine_recette-150x150.jpg",
          "1-Je suis un bandit.\n 2-Je suis dangereux",false,50)
    ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes recettes"),
      ),
      body: ListView.builder(
        itemCount: reciepes.length,
        itemBuilder: (context,index){
          final reciepe =reciepes[index];
          return Dismissible(key: Key(reciepe.title),
              onDismissed: (direction){
                setState(() {
                  reciepes.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${reciepe.title} supprimé")));
              },
              background: Container(color: Colors.red,),
              child:ReciepeItemWidget(reciepe: reciepe));
        },
      )
    );
  }
}
class ReciepeItemWidget extends StatelessWidget{
  const ReciepeItemWidget({Key? key, required this.reciepe}) : super(key: key);
  final Reciepe reciepe;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 8,
      child: Row(
        children: [
          CachedNetworkImage(
              placeholder: (context, url) =>
                  Center(
                    child: CircularProgressIndicator(),
                  ),
              imageUrl: reciepe.imageUrl,
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 100,
              height: 100,
              fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    reciepe.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text(reciepe.user,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),)
              ],
            ),
          )
        ],
      ),
    );
  }
}