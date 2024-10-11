import 'package:alarm/app.dart';
import 'package:alarm/components/alarm_item.dart';
import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  //la variable pour le temps
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 30);
  List<TimeOfDay>? _timesOfAlarm = [];

  //fonction pour afficher le sélecteur
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
        _timesOfAlarm?.add(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
   
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.indigo,
          hoverElevation: 0,
          hoverColor: Colors.indigo[300],
          onPressed: _showTimePicker,
          elevation: 100,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0,
        automaticallyImplyLeading: false,
        title:  IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => App()),
                );
              },
              icon:const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Icon(Icons.navigate_before),
                Text("Back",
                style: TextStyle(
                  fontSize: 15,
                ),
                ),
                ]),
            ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             
              const Text(
                "Alarm",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _timesOfAlarm!.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (_timesOfAlarm != []) {
                      return
                          // ListTile(
                          //   title: Text(_timesOfAlarm![index].format(context).toString()),
                          // );
                          AlarmItem(
                              text: _timesOfAlarm![index]
                                  .format(context)
                                  .toString());
                    } else {
                      return const Text("No data");
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
