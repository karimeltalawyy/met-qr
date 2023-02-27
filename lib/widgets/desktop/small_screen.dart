import 'package:flutter/material.dart';
import 'package:metqr/shared/component/constants/constants.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: surfaceColor,
      ),
    );
  }
}
