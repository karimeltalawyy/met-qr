import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metqr/providers/session_provider.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../screens/Lecturer/lecturer_home_page.dart';
import '../../shared/component/buttons.dart';
import '../../shared/component/formField.dart';
import '../../shared/component/toast.dart';

class LargeScreen extends HookWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home_filled,
      Icons.sell_outlined,
      Icons.headphones,
      Icons.favorite,
      Icons.search,
    ];
    List<String> titles = [
      'Home',
      'Sessions',
      'Reports',
      'Scheduling',
      'Students',
    ];
    final authLecturer = Provider.of<AuthProvider>(context);
    final lectureNameCtrl = useTextEditingController();
    final totalNumStudentCtrl = useTextEditingController();
    final lectureIdCtrl = useTextEditingController();
    final formKey = useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    return Consumer<SessionProvider>(
      builder: (context, state, child) {
        return Row(
          children: [
            Container(
              width: 220,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: 25,
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(flex: 1),
                  ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        leading: Icon(icons[index]),
                        title: Text(titles[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                  ),
                  const Spacer(flex: 5),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: surfaceColor,
                child: const LecturerHomePage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(basePadding),
              child: Container(
                padding: const EdgeInsets.all(basePadding),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: MediaQuery.of(context).size.width * .23,
                child: Form(
                  key: formKey.value,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Reports',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See all',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            'Attendance rate in (AI) lecture',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .2,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Text(
                            'Student Activity',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        child: DefaultFormField(
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'must not be empty';
                            }
                            return null;
                          },
                          controller: lectureNameCtrl,
                          keyboardType: TextInputType.multiline,
                          fillColor: greyColor,
                          prefixIcon: Icons.description_rounded,
                          hintText: 'Lecture name',
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        child: DefaultFormField(
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'must not be empty';
                            }
                            return null;
                          },
                          controller: totalNumStudentCtrl,
                          keyboardType: TextInputType.multiline,
                          fillColor: greyColor,
                          prefixIcon: Icons.description_rounded,
                          hintText: 'Total students',
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        child: DefaultFormField(
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'must not be empty';
                            }
                            return null;
                          },
                          controller: lectureIdCtrl,
                          keyboardType: TextInputType.multiline,
                          fillColor: greyColor,
                          prefixIcon: Icons.description_rounded,
                          hintText: 'Lecture Id',
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: DefaultButtonLecturer(
                                text: 'Save',
                                onPressed: () async {
                                  if (formKey.value.currentState!.validate()) {
                                    final lecture = await state.createLecture(
                                      lecturerId:
                                          authLecturer.lecturerModel!.id!,
                                      lectureId: lectureIdCtrl.value.text,
                                      name: lectureNameCtrl.value.text,
                                      lecturer:
                                          authLecturer.lecturerModel!.fullName!,
                                      totalStudents:
                                          totalNumStudentCtrl.value.text,
                                    );

                                    lecture != null
                                        ? showToast(
                                            state: ToastStates.SUCCESS,
                                            message: 'You all set')
                                        : false;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
