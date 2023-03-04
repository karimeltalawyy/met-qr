import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metqr/providers/auth_provider.dart';
import 'package:metqr/screens/Lecturer/signup/lecturer_signup_screen.dart';
import 'package:metqr/shared/component/buttons.dart';
import 'package:metqr/shared/component/components.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/shared/component/formField.dart';
import 'package:metqr/shared/component/loading.dart';
import 'package:provider/provider.dart';

class LecturerLoginScreen extends HookWidget {
  LecturerLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);
    final authProvider = Provider.of<AuthProvider>(context);
    final formKey = useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: MediaQuery.of(context).size.height / 2,
                          child: SvgPicture.asset(
                            'assets/images/log.svg',
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        controller: passwordController,
                                        validator: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'invalid cred!';
                                          }
                                          return null;
                                        },
                                        prefixIcon: Icons.lock_outline_rounded,
                                        hintText: 'password',
                                        suffixIcon: Icons.visibility_off,
                                      ),
                                      const SizedBox(height: 26),
                                      DefaultButtonLecturer(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.1,
                                        text: 'Login',
                                        onPressed: () async {
                                          if (formKey.value.currentState!
                                              .validate()) {
                                            isLoading.value = true;
                                            dynamic result = await authProvider
                                                .signInWithEmailAndPassword(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            );
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
        'Welcome back again!',
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
              // fontWeight: FontWeight.normal,
              fontFamily: 'ping',
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
        height: MediaQuery.of(context).size.height / 2.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: welcomeTextTitle(context),
            ),
            Expanded(
              flex: 5,
              child: textSubTitle(context),
            ),
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
            Text(
              'doesn\'t have an account yet?',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextButton(
              onPressed: () {
                navigateAndFinish(context, LecturerSignUpScreen());
              },
              child: Text(
                'Register',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ],
        ),
      );
}
