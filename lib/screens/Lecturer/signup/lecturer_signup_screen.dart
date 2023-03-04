import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metqr/layout/Lecturer_layout/lecturer_layout_screen.dart';
import 'package:metqr/providers/auth_provider.dart';
import 'package:metqr/screens/Lecturer/login/lecturer_login_screen.dart';
import 'package:metqr/shared/component/buttons.dart';
import 'package:metqr/shared/component/components.dart';
import 'package:metqr/shared/component/formField.dart';
import 'package:metqr/shared/component/toast.dart';
import 'package:provider/provider.dart';

import '../../../shared/component/constants/constants.dart';
import '../../../shared/component/loading.dart';

class LecturerSignUpScreen extends HookWidget {
  LecturerSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);
    final authProvider = Provider.of<AuthProvider>(context);
    final formKey = useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final initial = useState<String>('');
    final emailController = useTextEditingController(text: initial.value);
    final passwordController = useTextEditingController(text: initial.value);
    final nameController = useTextEditingController(text: initial.value);
    final phoneController = useTextEditingController(text: initial.value);

    return isLoading.value
        ? const Loading()
        : Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: surfaceColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: false,
              title: SvgPicture.asset(
                'assets/images/logo.svg',
                fit: BoxFit.cover,
              ),
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(basePadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: MediaQuery.of(context).size.height / 2,
                            child: SvgPicture.asset(
                              'assets/images/si.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 16),
                          onBoardingTitle(context),
                          const SizedBox(height: 6),
                          onBoardingSubTitle(context),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: surfaceColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(basePadding),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey.value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              header(context),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3.1,
                                height: MediaQuery.of(context).size.height,
                                child: SingleChildScrollView(
                                  // physics: const NeverScrollableScrollPhysics(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      DefaultFormField(
                                        controller: emailController,
                                        validator: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'invalid cred!';
                                          }
                                          return null;
                                        },
                                        prefixIcon: Icons.email_outlined,
                                        hintText: 'email',
                                      ),
                                      const SizedBox(height: 22),
                                      DefaultFormField(
                                        controller: nameController,
                                        validator: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'invalid cred!';
                                          }
                                          return null;
                                        },
                                        prefixIcon:
                                            Icons.person_outline_outlined,
                                        hintText: 'name',
                                      ),
                                      const SizedBox(height: 22),
                                      DefaultFormField(
                                        controller: phoneController,
                                        validator: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'invalid cred!';
                                          }
                                          return null;
                                        },
                                        prefixIcon: Icons.phone_outlined,
                                        hintText: 'phone',
                                      ),
                                      const SizedBox(height: 22),
                                      DefaultFormField(
                                        controller: passwordController,
                                        validator: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'invalid cred!';
                                          }
                                          return null;
                                        },
                                        prefixIcon: Icons.lock_outline_rounded,
                                        suffixIcon: Icons.visibility_off,
                                        hintText: 'enter strong password',
                                      ),
                                      const SizedBox(height: 26),
                                      DefaultButtonLecturer(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.1,
                                        text: 'Sign up',
                                        onPressed: () async {
                                          if (formKey.value.currentState!
                                              .validate()) {
                                            isLoading.value = true;
                                            dynamic result = await authProvider
                                                .createUserWithEmailAndPassword(
                                              email: emailController.value.text,
                                              password: passwordController.value.text,
                                              name: nameController.value.text,
                                              phone: phoneController.value.text,
                                            );
                                            navigateTo(
                                              context,
                                              LecturerLayout(),
                                            );
                                            debugPrint(nameController.text);
                                            debugPrint(emailController.text);
                                            debugPrint(phoneController.text);
                                            debugPrint(passwordController.text);
                                            if (result == null) {
                                              isLoading.value = false;
                                            }
                                          }
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      signUpTextButton(context),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget welcomeTextTitle(BuildContext context) => Text(
        'Create your account.',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.black87,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
      );

  Widget textSubTitle(BuildContext context) => Text(
        'Login to our METQ Platform, login to enjoy our services!',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
      );

  Widget onBoardingTitle(BuildContext context) => Text(
        'Enjoy our several features!',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.black87,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
      );

  Widget onBoardingSubTitle(BuildContext context) => Text(
        'Through our platform, you can easily track the activity of your students.',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
      );

  Widget header(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 60),
        width: MediaQuery.of(context).size.width,
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            welcomeTextTitle(context),
            const SizedBox(height: 4),
            textSubTitle(context),
          ],
        ),
      );

  Widget signUpTextButton(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width / 3.1,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            TextButton(
              onPressed: () {
                navigateAndFinish(
                  context,
                  LecturerLoginScreen(),
                );
              },
              child: const Text(
                'Login',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}
