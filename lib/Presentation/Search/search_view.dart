import 'package:flutter/material.dart';
import 'package:model/Presentation/Main/main_view.dart';
import 'package:model/Resources/color_manager.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary2,
        title: const Text("Search Books"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: TextFormField(
                  controller: controller,
                  decoration:
                      const InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey,),
                        hintText: "Search Books",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder()),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          RawMaterialButton(
            shape: const OutlineInputBorder(),
            fillColor: ColorManager.primary2,
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MainView(text: controller.text)));
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Search",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
