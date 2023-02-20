import 'package:flutter/material.dart';
import 'package:metqr/shared/component/constants/constants.dart';

import '../../../widgets/lecture_card_widget.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(basePadding),
      child: SingleChildScrollView(
        child: Column(
          children: const [
             LectureCardWidget(
              lectureTitle: 'Computer Vision Lecture.',
              lectureImage: 'assets/images/cv.png',
            ),
             SizedBox(height: 12),
             LectureCardWidget(
              lectureTitle: 'Artificial Intelligence Lecture.',
              lectureImage: 'assets/images/ai.png',
            ),
             SizedBox(height: 12),
             LectureCardWidget(
              lectureTitle: 'Software Engineering Lecture.',
              lectureImage: 'assets/images/sw.png',
            ),
            SizedBox(height: 12),
            LectureCardWidget(
              lectureTitle: 'Networking Programming Lecture.',
              lectureImage: 'assets/images/np.png',
            ),
          ],
        ),
      ),
    );
  }


}
