import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';

class TrackerPage extends StatefulWidget {
  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  
  Widget build(BuildContext content) => Scaffold(
    appBar: AppBar(
      title: const Text('Task Tracker'),
    ),
    body: Column(
      children: <Widget>[
        Container(
          child: Calendar(
            weekDays:['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
            events: _events,
            onDateSelected: (date) => _handleNewDate(date),
            isExpandable: true,
            eventDoneColor: Colors.green,
            selectedColor: Colors.blue,
            todayColor: Colors.lightBlue,
            locale: 'en_EN',
          ),
        ),
        _buildEventList()
      ],
    ),
  ); 

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          final CleanCalendarEvent event = _selectedEvents[index];
          final String start =
            DateFormat('HH:mm').format(event.startTime).toString();
          final String end =
            DateFormat('HH:mm').format(event.endTime).toString();
          return ListTile(
            contentPadding:
              EdgeInsets.only(left: 2.0, right: 8.0, top: 2.0, bottom: 2.0),
            leading: Container(
              width: 10.0,
              color: event.color,
            ),
            title: Text(event.summary),
            subtitle:
              event.description.isNotEmpty ? Text(event.description) : null,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(start), Text(end)],
            ),
            onTap: () {},
          );
        },
        itemCount: _selectedEvents.length,
      ),
    );
  }
}