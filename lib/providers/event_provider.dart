import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/eventModel.dart';

class EventProvider extends ChangeNotifier {
  //this is list of events passed to calender
  final List<Event> _events = [];

  List<Event> get events => _events;

  DateTime _selectedDate =
      DateTime.now(); //hold the date on the last clicked one

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventsOfSelectedDate => _events; // show the selected event date not all other date

  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }
}
