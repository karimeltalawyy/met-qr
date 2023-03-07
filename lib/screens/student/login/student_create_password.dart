import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metqr/shared/component/formField.dart';

import '../../../shared/component/buttons.dart';
import '../../../shared/component/components.dart';
import '../../../shared/component/constants/constants.dart';

class StudentCreatePassword extends HookWidget {
  const StudentCreatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: surfaceColor,
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
                  'Welcome karim!',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 26,
                  ),
                ),
                Text(
                  'Please enter your password',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 23,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'welcome in our platform in order to be able to access your account, you must enter strong password.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelLarge!.copyWith(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: 46),
                DefaultFormField(
                  securePassword: true,
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'invalid credentials';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.lock_outline_rounded,
                  hintText: 'enter strong password',
                ),
                const SizedBox(height: 16),
                DefaultFormField(

                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'invalid credentials';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.lock_outline_rounded,
                  suffixIcon: Icons.visibility_off,
                  hintText: 're enter strong password',
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
