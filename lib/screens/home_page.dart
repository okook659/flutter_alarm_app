import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  _onDaySelected(selectedDay, focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  _onFormatChanged(format) {
    if (_calendarFormat != format) {
      setState(() {
        _calendarFormat = format;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top : 20.0),
          child: Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.black,
              //     borderRadius: BorderRadius.circular(20) 
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left : 28.0, right: 28.0, top: 8.0, bottom: 8.0),
              //     child: Text("Clock", style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 30,
              //       fontStyle: FontStyle.italic,
              //     ),),
              //   ),
              // ),
              Text("Clock", style: TextStyle(
                fontSize: 30,
              )),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 300,
                child: AnalogClock(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.blue),
                      color: Colors.black,
                      shape: BoxShape.circle),
                  width: 150.0,
                  isLive: true,
                  hourHandColor: Colors.blue,
                  minuteHandColor: Colors.purple,
                  showSecondHand: true,
                  numberColor: Colors.white,
                  showNumbers: true,
                  textScaleFactor: 1.4,
                  showTicks: true,
                  showDigitalClock: true,
                  digitalClockColor: Colors.white,
                  datetime: DateTime.now(),
                ),
              ),
              Container(
                // height: 1000,
                child: TableCalendar(
                  headerVisible: true,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: true,
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.purple),
                    weekendStyle: TextStyle(color: Colors.red),
                  ),
                  calendarStyle: CalendarStyle(
                    
                  ),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 10, 16),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  calendarFormat: _calendarFormat,
                  onDaySelected: _onDaySelected,
                  onFormatChanged: _onFormatChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
