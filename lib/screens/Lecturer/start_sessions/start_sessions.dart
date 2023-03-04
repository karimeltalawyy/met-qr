import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:metqr/model/eventModel.dart';
import 'package:metqr/providers/event_provider.dart';
import 'package:metqr/shared/component/buttons.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/shared/component/formField.dart';
import 'package:metqr/widgets/defaultButton.dart';
import 'package:metqr/widgets/desktop/dropdowns.dart';
import 'package:metqr/widgets/desktop/reminder_toast.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../widgets/desktop/calender_widget.dart';

class StartSessions extends StatefulWidget {
  const StartSessions({
    Key? key,
    this.event,
  }) : super(key: key);

  //this obj hold all data the title and date and others
  final Event? event;

  @override
  State<StartSessions> createState() => _StartSessionsState();
}

class _StartSessionsState extends State<StartSessions> {
  List<String> itemsList = ['AI', 'CV', 'SE', 'NP', 'DB'];
  String? selectedItem = 'AI';

  final formKey = GlobalKey<FormState>();
  late DateTime fromDate;
  late DateTime toDate;

  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
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
                              _title(context),
                              const SizedBox(height: 32),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _dropDownTitleOne(context),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width * .3,
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        )),
                                        value: selectedItem,
                                        items: itemsList.map((item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList(),
                                        onChanged: (item) {
                                          setState(() {
                                            selectedItem = item;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _dropDownTitleTwo(context),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width * .3,
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        )),
                                        value: selectedItem,
                                        items: itemsList.map((item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList(),
                                        onChanged: (item) {
                                          setState(() {
                                            selectedItem = item;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _dropDownTitleThree(context),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width * .3,
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        )),
                                        value: selectedItem,
                                        items: itemsList.map((item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList(),
                                        onChanged: (item) {
                                          setState(() {
                                            selectedItem = item;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 22),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .3,
                                child: DefaultFormField(
                                  validator: (String? val) {
                                    if (val!.isEmpty) {
                                      return 'must not be empty';
                                    }
                                    return null;
                                  },
                                  controller: descriptionController,
                                  keyboardType: TextInputType.multiline,
                                  fillColor: greyColor,
                                  prefixIcon: Icons.description_rounded,
                                  hintText: 'Enter description',
                                ),
                              ),
                              const SizedBox(height: 16),
                              buildDateTimePickers(),
                              const SizedBox(height: 22),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .3,
                                height: 40,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: DefaultButtonLecturer(
                                        text: 'Save',
                                        onPressed: saveDateTime,
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
                          children: const [
                            CalenderWidget(),
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
  }

  Widget _title(BuildContext context) => Text(
        'Create Session',
        style: Theme.of(context).textTheme.titleLarge,
      );

  Widget _dropDownTitleOne(BuildContext context) => Text(
        'Lecture',
        style: Theme.of(context).textTheme.labelLarge,
      );

  Widget _dropDownTitleTwo(BuildContext context) => Text(
        'Education Level',
        style: Theme.of(context).textTheme.labelLarge,
      );

  Widget _dropDownTitleThree(BuildContext context) => Text(
        'Academic Division',
        style: Theme.of(context).textTheme.labelLarge,
      );

  Widget _header(BuildContext context) => Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(basePadding),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/logo.svg',
                      fit: BoxFit.cover,
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 120),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${DateFormat.MMMMEEEEd().format(DateTime.now())},',
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${DateFormat.Hms().format(DateTime.now())},',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    const SizedBox(width: 80),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 3.5,
                        child: const DefaultFormField(
                          fillColor: surfaceColor,
                          prefixIcon: Icons.search,
                          hintText: 'Search something....',
                        ),
                      ),
                    ),
                    const SizedBox(width: 22),
                    Expanded(
                      child: Container(
                        height: 50,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: imgContainerColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget buildDateTimePickers() => Column(
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
              text: DateFormat.yMMMEd().format(fromDate),
              onClicked: () => pickFromDateTime(pickDate: true),
            ),
          ),
          Expanded(
            child: buildDropDownField(
              text: DateFormat.Hm().format(fromDate),
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
              text: DateFormat.yMMMEd().format(toDate),
              onClicked: () => pickToDateTime(pickDate: true),
            ),
          ),
          Expanded(
            child: buildDropDownField(
              text: DateFormat.Hm().format(toDate),
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
      fromDate,
      pickDate: pickDate,
    );
    if (date == null) return;

    //to make sure the date isn't previous the date we choose
    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: pickDate
          ? fromDate
          : null, //to make sure we can't select date before the selected date
    );
    if (date == null) return;

    //to make sure the date isn't previous the date we choose
    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
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

  Future saveDateTime() async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      final event = Event(
        title: descriptionController.text,
        description: 'description',
        from: fromDate,
        to: toDate,
        isAllDay: false,
      );

      //add calender
      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);
      Navigator.of(context).pop();
    }
  }
}
