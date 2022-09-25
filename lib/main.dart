import 'package:flutter/material.dart';
import 'package:model/Presentation/Loading/loading_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Lab',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const LoadingView(),
    );
  }
}
