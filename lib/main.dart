import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/screens/allitems.dart';
import 'package:provider_app/providers/favorite_app/favorite_notifer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavortieItemNotifer())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AllItems(),
      ),
    );
  }
}
