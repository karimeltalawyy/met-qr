import 'package:flutter/material.dart';

class DefaultDropDown extends StatelessWidget {
  const DefaultDropDown({
    Key? key,
    required this.text,
    required this.selectedItem,
    this.items,
    this.onChanged,
  }) : super(key: key);
  final String text;
  final String selectedItem;
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .3,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
              value: selectedItem,
              items: items,
              onChanged: (item) {
                onChanged!(item);
              },
            ),
          ),
        ),
      ],
    );
  }
}


