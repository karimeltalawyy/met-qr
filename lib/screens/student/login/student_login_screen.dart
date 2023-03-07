import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metqr/screens/student/login/student_create_password.dart';
import 'package:metqr/screens/student/signup/student_signup_screen.dart';
import 'package:metqr/shared/component/buttons.dart';
import 'package:metqr/shared/component/components.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/shared/component/formField.dart';

class StudentLoginScreen extends HookWidget {
  const StudentLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: surfaceColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 20,
          width: 20,
        ),
        centerTitle: false,
        titleSpacing: basePadding,
      ),
      body: Padding(
        padding: const EdgeInsets.all(basePadding),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your Email address or your academic id.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'In order to be able to access your account, you must enter your e-mail, or your university id code.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelLarge!.copyWith(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: 46),
                DefaultFormField(
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'invalid credentials';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  hintText: 'ex@example.com',
                ),
                TextButton(
                  onPressed: () {
                    navigateTo(context,const StudentSignUpScreen());
                  },
                  child: Text(
                    'Use id instead?',
                    style: textTheme.labelLarge!.copyWith(
                      color: secondaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: DefaultButtonLecturer(
                    text: 'Next',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        navigateTo(context, const StudentCreatePassword());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
