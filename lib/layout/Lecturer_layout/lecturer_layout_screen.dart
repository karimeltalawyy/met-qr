import 'package:flutter/material.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/shared/component/responsiveness.dart';
import 'package:metqr/shared/component/top_navbar.dart';
import 'package:metqr/widgets/desktop/large_screen.dart';
import 'package:metqr/widgets/desktop/small_screen.dart';

class LecturerLayout extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  LecturerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: surfaceColor,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }

  Widget appTitle(BuildContext context) => Text(
        'METQ.',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
      );
}

