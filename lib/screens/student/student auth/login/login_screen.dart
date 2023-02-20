import 'package:flutter/material.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/widgets/defaultButton.dart';

import '../../../../shared/component/formField.dart';
import '../../../../shared/component/text_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: surfaceColor,
        centerTitle: false,
        title: _titleWidget(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(basePadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _loginTitle(context),
              const SizedBox(height: 8),
              _loginSubTitle(context),
              const SizedBox(height: 32),
              const DefaultFormField(
                prefixIcon: Icons.email_outlined,
                hintText: 'ex@example.com',
              ),
              DefaultTextButton(
                onPressed: () {},
                child: const Text('Use University code Instead?'),
              ),
              const SizedBox(height: 32),
              const DefaultButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleWidget(context) => Text(
        'METQ.',
        style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      );

  Widget _loginTitle(context) => Text(
        'Enter your Email address or your University code!',
        style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
      );

  Widget _loginSubTitle(context) => Text(
        'To reach your account you must provide your email address or university code.',
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Colors.black45,
            ),
      );
}
