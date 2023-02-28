import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metqr/screens/Lecturer/signup/lecturer_signup_screen.dart';
import 'package:metqr/shared/component/buttons.dart';
import 'package:metqr/shared/component/components.dart';
import 'package:metqr/shared/component/constants/constants.dart';

class LecturerLoginScreen extends StatelessWidget {
  LecturerLoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: const BoxDecoration(
                color: surfaceColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(basePadding),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(context),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.1,
                          height: MediaQuery.of(context).size.height / 2.6,
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  validator: (String? val) {
                                    if (val!.isEmpty) {
                                      return 'invalid cred!';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.white),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.white),
                                    ),
                                    border: InputBorder.none,
                                    fillColor: whiteColor,
                                    filled: true,
                                    hintText: 'eg.213123',
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 22),
                                TextFormField(
                                  validator: (String? val) {
                                    if (val!.isEmpty) {
                                      return 'invalid cred!';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    fillColor: whiteColor,
                                    filled: true,
                                    hintText: 'enter your password',
                                    prefixIcon: const Icon(
                                      Icons.lock_outline_rounded,
                                    ),
                                    suffixIcon:
                                        const Icon(Icons.visibility_outlined),
                                  ),
                                ),
                                const SizedBox(height: 26),
                                DefaultButtonLecturer(
                                  width:
                                      MediaQuery.of(context).size.width / 3.1,
                                  text: 'Login',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      debugPrint('validate');
                                    } else {
                                      debugPrint('you are not validate');
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

  Widget signUpTextButton(BuildContext context) => TextButton(
        onPressed: () {
          navigateAndFinish(context, LecturerSignUpScreen());
        },
        child: Text('Sign up'),
      );
// SizedBox(
//   width: MediaQuery.of(context).size.width / 3.1,
//   height: 40,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Expanded(
//         child: RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: 'Doesn\'t have an account yet? ',
//                 style: Theme.of(context).textTheme.labelLarge,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// );
}
