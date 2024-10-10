import 'package:alarm/components/alarm_item.dart';
import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  //la variable pour le temps
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);
  List<TimeOfDay>? _timesOfAlarm;

  //fonction pour afficher le sélecteur
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          hoverElevation: 0,
          hoverColor: Colors.blue,
          onPressed: _showTimePicker,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          elevation: 100,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Alarm",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                child: Text(
                  _timeOfDay.format(context).toString(),
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              AlarmItem(
                text: _timeOfDay.format(context).toString(),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
