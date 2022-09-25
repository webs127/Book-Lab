import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:model/Models/book_model.dart';
import 'package:http/http.dart' as http;
import 'package:model/Presentation/Description/description.dart';
import 'package:model/Resources/color_manager.dart';

abstract class HTTPRequest<T> {
  Future<T> execute();
}

class RequestBook implements HTTPRequest<Book> {
  final String url;
  RequestBook({required this.url});

  @override
  Future<Book> execute() async {
    var request = Uri.parse(url);
    var response = await http.get(request);
    if (response.statusCode != 200) {
      throw http.ClientException("Oh Darn");
    }
    var value = jsonDecode(response.body);
    return Book.fromJson(value);
  }
}

class HTTPWidget extends StatefulWidget {
  final String text;
  final HTTPRequest<Book> request;
  const HTTPWidget({required this.text, required this.request, Key? key})
      : super(key: key);

  @override
  State<HTTPWidget> createState() => _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget> {
  late final Future<Book> futureItem;
  @override
  void initState() {
    super.initState();
    futureItem = widget.request.execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Book>(
        future: futureItem,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.items.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DescriptionView(
                                  title:
                                      "${snapshot.data?.items[i].volumeinfo.title}",
                                  description: snapshot
                                      .data?.items[i].volumeinfo.description)));
                    },
                    title: Text("${snapshot.data?.items[i].volumeinfo.title}"),
                    trailing: (snapshot.data?.items[i].volumeinfo.pageCount ==
                            null)
                        ? const Text("NA")
                        : Text(
                            "${snapshot.data?.items[i].volumeinfo.pageCount}"),
                    subtitle: Text(
                        "${snapshot.data?.items[i].volumeinfo.authors[0]}"),
                  );
                });
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("No Books Available..."),
            );
          }
          return Center(
              child: CircularProgressIndicator(
            color: ColorManager.primary2,
          ));
        });
  }
}
