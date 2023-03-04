import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/shared/component/responsiveness.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: const [
                // SvgPicture.asset(
                //   'assets/images/logo.svg',
                //   fit: BoxFit.cover,
                // ),
              ],
            )
          : IconButton(
              onPressed: () {
                key.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
      title: Row(
        children: [
          // Visibility(
          //   child: Text(
          //     'METQ.',
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           fontWeight: FontWeight.bold,
          //         ),
          //   ),
          // ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: defaultColor,
                    border: Border.all(
                      color: whiteColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: Colors.black45,
          ),
          const SizedBox(width: 24),
          Text(
            'Karim Khaled',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: const CircleAvatar(
                child: Icon(
                  Icons.person_outline_sharp,
                ),
              ),
            ),
          ),
        ],
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.white,
    );
