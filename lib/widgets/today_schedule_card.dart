import 'package:flutter/material.dart';
import 'package:metqr/shared/component/components.dart';
import 'package:metqr/shared/component/constants/constants.dart';

import '../screens/student/details screen/details_screen.dart';

class TodayScheduleCard extends StatelessWidget {
  const TodayScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, const DetailsScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white54,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: defaultColor,
                child: Text(
                  '10:00PM',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Database Lecture',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Dr/Mohamed Ali',
                        style: Theme.of(context).textTheme.caption!.copyWith(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                      Text(
                        'Building: D ',
                        style: Theme.of(context).textTheme.caption!.copyWith(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Tap for more details',
                    style: Theme.of(context).textTheme.caption!.copyWith(),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
