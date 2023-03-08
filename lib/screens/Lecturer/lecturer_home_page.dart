import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metqr/providers/auth_provider.dart';
import 'package:metqr/providers/session_provider.dart';
import 'package:metqr/screens/Lecturer/qr_generator/qr_generator_screen.dart';
import 'package:metqr/screens/Lecturer/start_sessions/start_sessions.dart';
import 'package:metqr/shared/component/buttons.dart';
import 'package:metqr/shared/component/components.dart';
import 'package:metqr/shared/component/toast.dart';
import 'package:provider/provider.dart';

import '../../shared/component/constants/constants.dart';
import '../../shared/component/formField.dart';

class LecturerHomePage extends HookWidget {
  const LecturerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthProvider>(context);
    final sessionProvider = Provider.of<SessionProvider>(context);
    final subjectNameCtrl = useTextEditingController();
    final subjectGradeCtrl = useTextEditingController();
    final subjectDivisionCtrl = useTextEditingController();
    final formKey = useState<GlobalKey<FormState>>(GlobalKey<FormState>());

    return Padding(
      padding: const EdgeInsets.all(basePadding),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Good morning doctor Mark,',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black87,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Start new session to take student attendance now.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  DefaultButtonLecturer(
                    text: 'Start session',
                    width: MediaQuery.of(context).size.width / 3,
                    onPressed: () async {
                      navigateTo(context, StartSessions());
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            //sidebar
            Container(
              padding: const EdgeInsets.all(basePadding),
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Form(
                key: formKey.value,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Text(
                        'Create QR',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        width: 400,
                        height: 400,
                        child: Center(
                          child: QRGeneratorScreen(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
