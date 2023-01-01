import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/LoginApp/login_provider.dart';
import 'package:provider_app/providers/ThemeChange/theme_changer_provider.dart';
import 'package:provider_app/screens/FavoriteApp/allitems.dart';
import 'package:provider_app/providers/favorite_app/favorite_notifer.dart';
import 'package:provider_app/screens/Login_Proivder_RestAPI/login.dart';
import 'package:provider_app/screens/ThemeChangeApp/dark_theme.dart';
import 'package:provider_app/screens/UseStlAsStf/value_notify_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavortieItemNotifer()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.grey[900],
            textTheme: TextTheme(
              headline1: const TextStyle(
                  fontSize: 72.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              headline2: const TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyText1: const TextStyle(fontSize: 14.0, color: Colors.white),
              bodyText2: TextStyle(fontSize: 14.0, color: Colors.grey[300]),
            ),
          ),
          home: LoginScreen(),
        );
      }),
    );
  }
}
