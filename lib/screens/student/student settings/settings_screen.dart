import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metqr/shared/component/constants/constants.dart';

import '../../../widgets/settings_card_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        titleSpacing: basePadding,
        backgroundColor: surfaceColor,
        centerTitle: false,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 20,
          width: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(basePadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 65,
                        backgroundColor: surfaceColorOpacity,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: secondaryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text('@Mark jr',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 6),
                      Text('Fourth year , Computer Science',
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const SettingsCardWidget(
                text: 'Mark Jr',
              ),
              const SizedBox(height: 12),
              const SettingsCardWidget(
                title: 'Academic Code',
                text: '20202032',
                leadingIcon: Icons.key_rounded,
              ),
              const SizedBox(height: 12),
              const SettingsCardWidget(
                title: 'Email',
                leadingIcon: Icons.email_outlined,
                text: 'ex@example.com',
              ),
              const SizedBox(height: 12),
              const SettingsCardWidget(
                title: 'Phone',
                text: '+001239102392',
                leadingIcon: Icons.phone_enabled_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
