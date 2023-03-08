import 'package:flutter/material.dart';
import 'package:metqr/providers/session_provider.dart';
import 'package:metqr/shared/component/components.dart';
import 'package:metqr/shared/component/constants/constants.dart';
import 'package:metqr/widgets/desktop/event_datasource.dart';
import 'package:metqr/widgets/desktop/event_viewing_page.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SessionProvider>(context);
    // final selectedEvents = provider.eventsOfSelectedDate;
    // if (selectedEvents.isEmpty) {
    //   return const Center(
    //     child: Text('No events found'),
    //   );
    // }
    return SfCalendar(
      view: CalendarView.timelineDay,
      // dataSource: EventDataSource(provider.events),
      // initialDisplayDate: provider.selectedDate,
      appointmentBuilder: appointmentBuilder,
      headerHeight: 0,
      todayHighlightColor: Colors.black,
      selectionDecoration: BoxDecoration(
        color: Colors.red.withOpacity(.3),
      ),
      onTap: (details) {
        if (details.appointments == null) return;
        final event = details.appointments!.first;
         navigateTo(context, EventViewingPage(event:event));
      },
    );
  }
}

Widget appointmentBuilder(
    BuildContext context, CalendarAppointmentDetails details) {
  final event = details.appointments.first;
  return Container(
    width: details.bounds.width,
    height: details.bounds.height,
    decoration: BoxDecoration(
      color: defaultColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Text(
        event.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ),
  );
}
