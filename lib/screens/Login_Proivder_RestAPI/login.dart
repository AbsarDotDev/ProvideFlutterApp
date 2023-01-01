import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/LoginApp/login_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            Consumer<AuthProvider>(
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {
                    value.login(_emailController.text.toString(),
                        _passwordController.text.toString());
                  },
                  child: value.isLoading
                      ? CircularProgressIndicator()
                      : Text('Log In'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
