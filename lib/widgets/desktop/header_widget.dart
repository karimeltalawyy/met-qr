import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../shared/component/constants/constants.dart';
import '../../shared/component/formField.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
              color: whiteColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(basePadding),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    fit: BoxFit.cover,
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(width: 120),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${DateFormat.MMMMEEEEd().format(DateTime.now())},',
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${DateFormat.Hms().format(DateTime.now())},',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                  const SizedBox(width: 80),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: const DefaultFormField(
                        fillColor: surfaceColor,
                        prefixIcon: Icons.search,
                        hintText: 'Search something....',
                      ),
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: Container(
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: imgContainerColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
