import 'package:flutter/material.dart';
import 'package:metqr/shared/component/constants/constants.dart';

class UniversitySchedule extends StatelessWidget {
  const UniversitySchedule({
    Key? key,
    this.lecTitle,
    this.lecDoctor,
    this.lecTime,
    this.lecDay,
    this.secTitle,
    this.secAssistant,
    this.secTime,
    this.secDay,
  }) : super(key: key);
  final String? lecTitle;
  final String? lecDoctor;
  final String? lecTime;
  final String? lecDay;
  final String? secTitle;
  final String? secAssistant;
  final String? secTime;
  final String? secDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'University Schedule',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * .4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: secondaryColor,
                    ),
                    width: MediaQuery.of(context).size.width * .24,
                    height: MediaQuery.of(context).size.height * .4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          lecTime ?? 'Saturday',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.height * .3033,
                        height: MediaQuery.of(context).size.height * .4,
                        child: Column(
                          children: [
                            Expanded(
                              child: _lectureWidget(context),
                            ),
                            Expanded(
                              child: _sectionWidget(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _lectureWidget(context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
          ),
          color: whiteColor,
        ),
        height: MediaQuery.of(context).size.height * .4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      lecTitle ?? 'Artificial intelligence Lecture',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.person_outline),
                  const SizedBox(width: 4),
                  Text(
                    lecDoctor ?? 'Dr/Ibrahim Mohamed',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 4),
                  Text(
                    lecTime ?? '11:00 AM - 2:00 PM',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _sectionWidget(context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
          ),
          color: greyColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      secTitle ?? 'Computer Vision Section.',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.person_outline),
                  const SizedBox(width: 4),
                  Text(
                    secAssistant ?? 'Dr/Ibrahim Mohamed',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 4),
                  Text(
                    secTime ?? '11:00 AM - 2:00 PM',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
