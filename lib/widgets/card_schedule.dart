
import 'package:flutter/material.dart';
import 'package:metqr/shared/component/components.dart';
import 'package:metqr/shared/component/constants/constants.dart';

import '../screens/student/details screen/details_screen.dart';

class CardSchedule extends StatelessWidget {
  const CardSchedule({Key? key, this.title, this.drName, this.location})
      : super(key: key);
  final String? title;
  final String? drName;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width * .9,
      padding: const EdgeInsets.all(basePadding),
      decoration: BoxDecoration(
          boxShadow: const [],
          color: whiteColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: surfaceColor, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _lectureTitle(context),
          ),
          Row(
            children: [
              _doctorName(context),
              const SizedBox(width: 8),
              _lectureLocation(context),
              TextButton(
                  onPressed: () {
                    navigateTo(context,const DetailsScreen());
                  },
                  child: Row(
                    children: [
                      Text(
                        'More details',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const Icon(
                        Icons.arrow_right_alt_rounded,
                        size: 18,
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _lectureTitle(context) => Text(
        title!,
        maxLines: 2,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
      );

  Widget _doctorName(context) => Container(
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
              drName??'Dr/Bahaa Ahmed',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: chipOneTextColor,
                    fontSize: 13,
                  ),
            )
          ],
        ),
      );

  Widget _lectureLocation(context) => Container(
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
      );
}
