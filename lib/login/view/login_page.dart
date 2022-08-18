import 'package:flutter/material.dart';
import 'package:protask/login/view/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //backgroundColor: Colors.blue,
      /* appBar: AppBar(
          title: const Text('Login'),
        ), */
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: LoginForm(),
      ),
    );
  }
}
