import 'package:flutter/material.dart';
import 'package:metqr/shared/component/components.dart';

import '../screens/student/details screen/details_screen.dart';
import '../shared/component/constants/constants.dart';

class LectureCardWidget extends StatelessWidget {
  const LectureCardWidget({Key? key, this.lectureTitle, this.lectureImage}) : super(key: key);
  final String? lectureTitle;
  final String? lectureImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: surfaceColor,
      onTap: () {
        navigateTo(context, const DetailsScreen());
      },
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lectureTitle?? 'AI',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        ),
                        const SizedBox(height: 6),
                        Text('Tab for more details.',
                            style:
                            Theme.of(context).textTheme.caption!.copyWith(
                              decoration: TextDecoration.underline,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 140,
                  height: 140,
                  child: Image.asset(
                    lectureImage ?? 'assets/images/ai.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: chipOneColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: surfaceColor, width: 1),
                  ),
                  width: 120,
                  height: 42,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dr/Bahaa Ahmed',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: chipOneTextColor,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: chipTwoColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: chipTwoColor, width: 1),
                  ),
                  width: 40,
                  height: 42,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LG',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: chipTwoTextColor,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
