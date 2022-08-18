import 'package:flutter/material.dart';
import 'package:protask/app.dart';
import 'package:protask/repo/auth_repo.dart';
import 'package:protask/repo/chat_repo.dart';
import 'package:protask/repo/user_repo.dart';

void main() {
  runApp(
    App(
      authRepo: AuthRepo(),
      userRepo: UserRepo(),
      chatRepo: ChatRepo(),
    ),
  );
}

/* class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(authRepo: ),
    );
  }
}
 */