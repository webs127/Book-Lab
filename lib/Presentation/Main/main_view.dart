import 'package:flutter/material.dart';
import 'package:model/Models/network.dart';
import 'package:model/Resources/color_manager.dart';

class MainView extends StatefulWidget {
  final String text;
  const MainView({required this.text, Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  //String url = "https://www.googleapis.com/books/v1/volumes?q=pdf+&key=AIzaSyCVv137gGK6TmjnEZAKQJalq_361XtLtY4";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Books"),
        centerTitle: true,
        backgroundColor: ColorManager.primary2,
      ),
      body:  HTTPWidget(request: RequestBook(url: "https://www.googleapis.com/books/v1/volumes?q=${widget.text}+&key=AIzaSyCVv137gGK6TmjnEZAKQJalq_361XtLtY4"), text: widget.text,),
    );
  }
}
