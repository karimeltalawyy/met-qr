import 'package:flutter/material.dart';

import '../shared/component/constants/constants.dart';
import 'defaultButton.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height /3,
      decoration: BoxDecoration(
        color: cardAttendColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning',
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.grey.shade400,
                ),
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 2,
            child: Text(
              'Take your attendance now!',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            flex:1,
            child: Text(
              'Scan the QR code and take your attendance in the current lecture',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
           const Spacer(),
           DefaultButton(),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'be sure your attend',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.grey.shade400,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
