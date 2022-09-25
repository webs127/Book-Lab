import 'package:flutter/material.dart';
import '../../Resources/color_manager.dart';

class DescriptionView extends StatelessWidget {
  final String? description;
  final String title;
  const DescriptionView(
      {required this.description, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: ColorManager.primary2,
      ),
      body: SingleChildScrollView(
        child: (description == null)
            ? const Center(
              heightFactor: 60,
              child: Text("Description not available"))
            : Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              child: Text(
                  description!,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
            ),
      ),
    );
  }
}
