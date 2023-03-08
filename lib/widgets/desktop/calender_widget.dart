import 'package:flutter/material.dart';
import 'package:metqr/providers/session_provider.dart';
import 'package:metqr/widgets/desktop/event_datasource.dart';
import 'package:metqr/widgets/desktop/task_widget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final events = Provider.of<SessionProvider>(context).events;
    return SfCalendar(
      view: CalendarView.week,
      firstDayOfWeek: 6,
      initialDisplayDate: DateTime.now(),
      initialSelectedDate: DateTime.now(),
      // dataSource: EventDataSource(events),
      onLongPress: (details) {
        final provider = Provider.of<SessionProvider>(context, listen: false);
      },
    );
  }
}
