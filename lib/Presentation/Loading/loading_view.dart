import 'dart:async';

import 'package:flutter/material.dart';
import 'package:model/Resources/color_manager.dart';

import '../Search/search_view.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 3), nextPage);
  }

  void nextPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SearchView()));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary2,
      body: const Center(
        child: Text("Book Lab", style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
