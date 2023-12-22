import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:secret/favoriteChangeNotifier.dart';
import 'package:secret/favoriteWidget.dart';
import 'package:secret/reciepe.dart';

class ReciepeScreen extends StatelessWidget {
  const ReciepeScreen({Key? key, required this.reciepe}) : super(key: key);
  final Reciepe reciepe;
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
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
                Text(
                  reciepe.user,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                )
              ],
            )),
        FavoriteIconWidget(),
          FavoriteTextWidget()
          ],
        ));
    Widget buttonSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _buildButtonColumn(Colors.blue, Icons.comment, "Commenter"),
        _buildButtonColumn(Colors.blue, Icons.share, "Partager")
      ]),
    );
    Widget descriptonSection = Container(
        padding: const EdgeInsets.all(32),
        child: Text(
            "1-Premiere etape. \n 2-Deuxieme etape.\n3-Troisieme etape.\n4-Quatrieme etape",
            softWrap: true));

    return ChangeNotifierProvider(
      create: (context)=> FavoriteChangeNotifier(reciepe.isFavorite, reciepe.favoriteCount),
      child: Scaffold(
          appBar: AppBar(title: Text("Mes recettes")),
          body: ListView(children: [
            Stack(
              children: [
                CachedNetworkImage(
                    placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                    imageUrl: reciepe.imageUrl,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: 600,
                    height: 240,
                    fit: BoxFit.cover)
              ],
            ),
            titleSection,
            buttonSection,
            descriptonSection
          ])),
    );
  }

  //Fonction pour la creation de bouton
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Icon(icon, color: color)),
        Text(
          label,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: color),
        )
      ],
    );
  }
}
