import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metqr/layout/student%20layout/stu_layout_screen.dart';
import 'package:metqr/providers/student_auth_provider.dart';
import 'package:metqr/screens/student/login/student_create_password.dart';
import 'package:metqr/shared/component/buttons.dart';
import 'package:metqr/shared/component/components.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/shared/component/formField.dart';
import 'package:metqr/shared/component/loading.dart';
import 'package:provider/provider.dart';

class StudentSignUpScreen extends HookWidget {
  const StudentSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isLoading = useState<bool>(false);
    final authProvider = Provider.of<StudentAuthProvider>(context);
    final formKey = useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final initial = useState<String>('');
    final emailCtrl = useTextEditingController(text: initial.value);
    final universityCodeCtrl = useTextEditingController(text: initial.value);
    final phoneCtrl = useTextEditingController(text: initial.value);
    final passwordCtrl = useTextEditingController(text: initial.value);
    final fullNameCtrl = useTextEditingController(text: initial.value);
    return isLoading.value
        ? const Loading()
        : Scaffold(
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
                key: formKey.value,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create an account',
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
                        'In order to be able to access our platform, you must provide e-mail, and your university id code.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelLarge!.copyWith(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      const SizedBox(height: 46),
                      DefaultFormField(
                        controller: emailCtrl,
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
                      const SizedBox(height: 16),
                      DefaultFormField(
                        controller: universityCodeCtrl,
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'invalid credentials';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        prefixIcon: Icons.credit_card_outlined,
                        hintText: 'ex12345',
                      ),
                      const SizedBox(height: 16),
                      DefaultFormField(
                        controller: fullNameCtrl,
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'invalid credentials';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.person_outline_outlined,
                        hintText: 'ex.karim',
                      ),
                      const SizedBox(height: 16),
                      DefaultFormField(
                        controller: phoneCtrl,
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'invalid credentials';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        prefixIcon: Icons.phone_outlined,
                        hintText: 'enter phone number',
                      ),
                      const SizedBox(height: 16),
                      DefaultFormField(
                        controller: passwordCtrl,
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'invalid credentials';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.lock_outline_rounded,
                        hintText: 'enter strong password',
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign in?',
                          style: textTheme.labelLarge!.copyWith(
                            color: secondaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 120),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: DefaultButtonLecturer(
                          text: 'Create account',
                          onPressed: () async {
                            if (formKey.value.currentState!.validate()) {
                              isLoading.value = true;
                              dynamic result = await authProvider
                                  .createUserWithEmailAndPassword(
                                email: emailCtrl.value.text,
                                password: passwordCtrl.value.text,
                                fullName: fullNameCtrl.value.text,
                                phone: phoneCtrl.value.text,
                                universityCode: universityCodeCtrl.value.text,
                              );
                              navigateTo(
                                context,
                                StudentLayoutPage(),
                              );
                              debugPrint(fullNameCtrl.text);
                              debugPrint(emailCtrl.text);
                              debugPrint(phoneCtrl.text);
                              debugPrint(passwordCtrl.text);
                              if (result == null) {
                                isLoading.value = false;
                              }
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
