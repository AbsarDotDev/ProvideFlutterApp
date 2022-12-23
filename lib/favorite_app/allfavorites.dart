import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/favorite_app/favorite_notifer.dart';

class AllFavorites extends StatefulWidget {
  const AllFavorites({super.key});

  @override
  State<AllFavorites> createState() => _AllFavoritesState();
}

class _AllFavoritesState extends State<AllFavorites> {
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite App With Provider"),
        actions: [
          InkWell(
            child: Icon(Icons.favorite_sharp),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllFavorites(),
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<FavortieItemNotifer>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.favorites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        value.removeitemat(index);
                      },
                      title: Text("Item" + " ${value.favorites[index]}"),
                      trailing: Icon(Icons.favorite));
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
