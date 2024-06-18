import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platformconverterapp/provider/platform_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late String date;
  late String time;

  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime? pickedDate;
  TimeOfDay? pickedTime;

  @override
  void initState() {
    super.initState();

    date = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    if (dateTime.hour <= 12) {
      time = "${timeOfDay.hour}:${timeOfDay.minute} ${timeOfDay.period.name} ";
    } else {
      time =
          "${timeOfDay.hour - 12}:${timeOfDay.minute} ${timeOfDay.period.name} ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlatformProvider>(context).isIOS)
        ? CupertinoPageScaffold(
            child: Container(
              color: Colors.white,
            ),
          )
        : Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        pickedDate = await showDatePicker(
                          context: context,
                          initialDate:
                              (pickedDate != null) ? pickedDate : dateTime,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            date =
                                "${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}";
                          });
                        }
                      },
                      child: Text("Pick Date"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        pickedTime = await showTimePicker(
                            context: context, initialTime: timeOfDay);
                        setState(() {
                          if (pickedTime != null) {
                            time =
                                "${pickedTime!.hour}:${pickedTime!.minute} ${pickedTime!.period.name}";
                          }
                        });
                      },
                      child: Text("Pick Time"),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
