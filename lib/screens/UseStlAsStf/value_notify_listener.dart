import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print("build");
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: toggle.value,
                decoration: InputDecoration(
                    hintText: "Password",
                    suffix: InkWell(
                      onTap: () {
                        toggle.value = !toggle.value;
                      },
                      child: Icon(toggle.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility),
                    )),
              );
            },
          )
        ],
      )),
    );
  }
}
