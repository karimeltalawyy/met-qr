import 'package:flutter/material.dart';
import 'package:metqr/shared/component/constants/constants.dart';

class SettingsCardWidget extends StatelessWidget {
  const SettingsCardWidget({
    Key? key,
    this.text,
    this.title,
    this.leadingIcon,
  }) : super(key: key);
  final String? text;
  final String? title;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
           Icon(
            leadingIcon ?? Icons.person_outline,
          ),
          const SizedBox(width: 12),
          Text(
            title ??'Name',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Text(
            text ?? 'Mark Jr',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
