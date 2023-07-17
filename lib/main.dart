import 'package:flutter/material.dart';
import 'package:untitled1/home.dart';
import 'package:untitled1/list_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        ExampleApp.routName: (context) => const ExampleApp(),
      },
      home: const Scaffold(
        body: SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}
