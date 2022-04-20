import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otterdev_gallery/controllers/user_controller.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController c = Get.find(tag: "user");
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.send,
      decoration: const InputDecoration(
        hintText: "Search user...",
        suffixIcon: Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.search),
        ),
      ),
      onFieldSubmitted: (value) => c.fetch(name: value),
    );
  }
}
