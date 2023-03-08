import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:metqr/model/SessionSchudle.dart';
import 'package:metqr/providers/auth_provider.dart';
import 'package:metqr/providers/session_provider.dart';
import 'package:metqr/shared/component/buttons.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/shared/component/formField.dart';
import 'package:metqr/widgets/desktop/header_widget.dart';
import 'package:provider/provider.dart';

import '../../../model/eventModel.dart';
import '../../../shared/component/toast.dart';
import '../../../widgets/desktop/calender_widget.dart';
import '../../../widgets/desktop/dropdown_future_item.dart';

class StartSessions extends StatefulWidget {
  StartSessions({
    super.key,
    this.session,
  });
  Session? session;
  Event? event;

  @override
  State<StartSessions> createState() => _StartSessionsState();
}

class _StartSessionsState extends State<StartSessions> {
  DateTime? fromDate = DateTime.now();
  DateTime? toDate = DateTime.now().add(const Duration(hours: 2));

  final formKey = GlobalKey<FormState>();
  final TextEditingController descriptionCtrl = TextEditingController();
  final TextEditingController lectureIdCtrl = TextEditingController();

  @override
  void initState() {
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lecturerAuth = Provider.of<AuthProvider>(context);
    final sessionProvider = Provider.of<SessionProvider>(context);
    final textTheme = Theme.of(context).textTheme;

    return Consumer<SessionProvider>(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: surfaceColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWidget(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(basePadding),
                    margin: const EdgeInsets.all(baseMargin),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Form(
                            key: formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 32),
                                  Text(
                                    'Create Session',
                                    style: textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 32),
                                  Text('Lecture', style: textTheme.titleMedium),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    child: const DropDownFutureItem(),
                                  ),
                                  const SizedBox(height: 22),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    child: DefaultFormField(
                                      validator: (String? val) {
                                        if (val!.isEmpty) {
                                          return 'must not be empty';
                                        }
                                        return null;
                                      },
                                      controller: descriptionCtrl,
                                      keyboardType: TextInputType.multiline,
                                      fillColor: greyColor,
                                      prefixIcon: Icons.info,
                                      hintText: 'Lecture Description',
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .3,
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
                                      hintText: 'Lecture id',
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    padding: const EdgeInsets.all(basePadding),
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: greyColor,
                                    ),
                                    child: buildDateTimePickers(context),
                                  ),
                                  const SizedBox(height: 22),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: DefaultButtonLecturer(
                                            text: 'Save',
                                            onPressed: () async {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                final session =
                                                    await state.createSession(
                                                  lecturerId: lecturerAuth
                                                      .lecturerModel!.id!,
                                                  lecturerName: descriptionCtrl
                                                      .value.text,
                                                  datesString:
                                                      lectureIdCtrl.value.text,
                                                );
                                                session != null
                                                    ? showToast(
                                                        state:
                                                            ToastStates.SUCCESS,
                                                        message: 'you all set',
                                                      )
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
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(basePadding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.shade100,
                            ),
                            child: Column(
                              children: [
                                const CalenderWidget(),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Save event'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildDateTimePickers(context) => Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(15),
            ),
            width: MediaQuery.of(context).size.width * .3,
            child: buildFromDate(),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(15),
            ),
            width: MediaQuery.of(context).size.width * .3,
            child: buildToDate(),
          ),
        ],
      );

  Widget buildFromDate() => Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropDownField(
              text: DateFormat.yMMMEd().format(fromDate!),
              onClicked: () => pickFromDateTime(pickDate: true),
            ),
          ),
          Expanded(
            child: buildDropDownField(
              text: DateFormat.Hm().format(fromDate!),
              onClicked: () => pickFromDateTime(pickDate: false),
            ),
          ),
        ],
      );

  Widget buildToDate() => Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropDownField(
              text: DateFormat.yMMMEd().format(toDate!),
              onClicked: () => pickToDateTime(pickDate: true),
            ),
          ),
          Expanded(
            child: buildDropDownField(
              text: DateFormat.Hm().format(toDate!),
              // it's false because we want to select time
              onClicked: () => pickToDateTime(pickDate: false),
            ),
          ),
        ],
      );

  Widget buildDropDownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      fromDate!,
      pickDate: pickDate,
    );
    if (date == null) return;

    //to make sure the date isn't previous the date we choose
    if (date.isAfter(toDate!)) {
      toDate = DateTime(
          date.year, date.month, date.day, toDate!.hour, toDate!.minute);
    }
    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate!,
      pickDate: pickDate,
      firstDate: pickDate
          ? fromDate
          : null, //to make sure we can't select date before the selected date
    );
    if (date == null) return;

    //to make sure the date isn't previous the date we choose
    if (date.isAfter(toDate!)) {
      toDate = DateTime(
          date.year, date.month, date.day, toDate!.hour, toDate!.minute);
    }
    setState(() => toDate = date);
  }

  // this combine date and time into one
  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2023, 2),
        lastDate: DateTime(2101),
      );
      if (date == null) return null;
      final time = Duration(
        hours: initialDate.hour,
        minutes: initialDate.minute,
      );
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (timeOfDay == null) return null;
      final date = DateTime(
        initialDate.year,
        initialDate.month,
        initialDate.day,
      );
      final time = Duration(
        hours: timeOfDay.hour,
        minutes: timeOfDay.minute,
      );
      return date.add(time);
    }
  }
}
