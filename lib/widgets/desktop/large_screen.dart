import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metqr/shared/component/constants/constants.dart';

import '../../screens/Lecturer/lecturer_home_page.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home_filled,
      Icons.sell_outlined,
      Icons.headphones,
      Icons.favorite,
      Icons.search,
    ];
    List<String> titles = [
      'Home',
      'Sessions',
      'Reports',
      'Scheduling',
      'Students',
    ];

    return Row(
      children: [
        Container(
          width: 220,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              SizedBox(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(flex: 1),
              ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    leading: Icon(icons[index]),
                    title: Text(titles[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: surfaceColor,
            child: const LecturerHomePage(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(basePadding),
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            width: MediaQuery.of(context).size.width * .23,
            child: Column(
              children: const [],
            ),
          ),
        )
      ],
    );
  }
}
