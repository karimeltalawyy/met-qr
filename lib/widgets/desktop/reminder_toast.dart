import 'package:flutter/material.dart';

import '../../shared/component/constants/constants.dart';

class ReminderToast extends StatelessWidget {
  const ReminderToast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: basePadding,
            right: basePadding,
          ),
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: toastColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.workspace_premium,color: defaultColor,),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'You\'re going to create new session to take student attendance!',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close),
              )
            ],
          ),
        ),
      ],
    );
  }
}
