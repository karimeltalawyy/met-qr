import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../layout/cubit/states.dart';
import '../../../shared/component/constants/constants.dart';
import '../../../widgets/card_schedule.dart';
import '../../../widgets/university_schedule.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      body: Padding(
        padding: const EdgeInsets.all(basePadding),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CardSchedule(
                  title: 'Computer Vision Lecture.',
                ),
                SizedBox(height: 12),
                CardSchedule(
                  title: 'Computer Vision Section.',
                ),
                SizedBox(height: 22),
                UniversitySchedule(
                  lecTitle: 'Artificial Intelligence Lecture.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
