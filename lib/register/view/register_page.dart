import 'package:flutter/material.dart';
import 'package:protask/register/view/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const route = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Register'),
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: RegisterForm(),
      ),
    );
  }
}
