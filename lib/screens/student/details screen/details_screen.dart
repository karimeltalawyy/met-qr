import 'package:flutter/material.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/widgets/settings_card_widget.dart';

import '../../../widgets/lecture_card_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(basePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LectureCardWidget(
              lectureImage: 'assets/images/ai.png',
              lectureTitle: 'Computer Vision Lecture.',
            ),
            const SizedBox(height: 32),
            Text(
              'Lecture Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const SettingsCardWidget(
              leadingIcon: Icons.access_time,
              title: 'Time',
              text: '10:00AM',
            ),
            const SizedBox(height: 12),
            const SettingsCardWidget(
              leadingIcon: Icons.location_on_outlined,
              title: 'Location',
              text: '402',
            ),
            const SizedBox(height: 12),
            const SettingsCardWidget(
              leadingIcon: Icons.person_outline,
              title: 'Doctor',
              text: 'DR/Ibrahim',
            ),
            const SizedBox(height: 12),
            const SettingsCardWidget(
              leadingIcon: Icons.location_city_outlined,
              title: 'Building',
              text: 'D',
            ),
          ],
        ),
      ),
    );
  }
}
