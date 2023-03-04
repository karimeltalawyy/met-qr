import 'package:flutter/material.dart';
import 'package:metqr/model/eventModel.dart';
import 'package:metqr/shared/component/constants/constants.dart';

class EventViewingPage extends StatelessWidget {
  const EventViewingPage({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(basePadding),
        children: [
          buildDateTime(event),
          const SizedBox(height: 32),
          Text(
            event.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 22),
          Text(
            event.description,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-day' : 'From', event.from),
        if (!event.isAllDay) buildDate('To', event.to),
      ],
    );
  }

  buildDate(String title, DateTime date) {}
}
