import 'package:flutter/material.dart';
import 'package:metqr/providers/event_provider.dart';
import 'package:metqr/widgets/desktop/event_datasource.dart';
import 'package:metqr/widgets/desktop/task_widget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return SfCalendar(
      dataSource: EventDataSource(events),
      onLongPress: (details) {
        final provider = Provider.of<EventProvider>(context, listen: false);
        provider.setDate(details.date!);
        showModalBottomSheet(
          context: context,
          builder: (context) => const TaskWidget(),
        );
      },
    );
  }
}