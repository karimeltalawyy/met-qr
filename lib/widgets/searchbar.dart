import 'package:flutter/material.dart';

import '../shared/component/constants/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) {

      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: whiteColor,
        contentPadding: const EdgeInsets.all(0),
        hintText: 'Search something...',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade500,
        ),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
