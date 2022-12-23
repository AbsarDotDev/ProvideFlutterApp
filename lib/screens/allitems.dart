import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/screens/allfavorites.dart';
import 'package:provider_app/providers/favorite_app/favorite_notifer.dart';

class AllItems extends StatefulWidget {
  const AllItems({super.key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  @override
  Widget build(BuildContext context) {
    print('asdasd');
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
          Expanded(
              child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Consumer<FavortieItemNotifer>(
                builder: (context, value, child) {
                  return ListTile(
                      onTap: () {
                        if (value.favorites.contains(index)) {
                          value.removeitem(index);
                        } else {
                          value.additem(index);
                        }
                      },
                      title: Text("Item $index"),
                      trailing: value.favorites.contains(index)
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border));
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
