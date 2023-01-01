import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_app/providers/ThemeChange/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    print("object");
    return SafeArea(
      child: Scaffold(
        body: Consumer<ThemeChanger>(
          builder: (context, value, child) {
            return Column(
              children: [
                RadioListTile<ThemeMode>(
                    title: Text("Light Theme"),
                    value: ThemeMode.light,
                    groupValue: value.themeMode,
                    onChanged: value.setTheme),
                RadioListTile<ThemeMode>(
                    title: Text("Dark Theme"),
                    value: ThemeMode.dark,
                    groupValue: value.themeMode,
                    onChanged: value.setTheme),
                RadioListTile<ThemeMode>(
                    title: Text("System Theme"),
                    value: ThemeMode.system,
                    groupValue: value.themeMode,
                    onChanged: value.setTheme),
              ],
            );
          },
        ),
      ),
    );
  }
}
