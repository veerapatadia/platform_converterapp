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
    time =
        "${timeOfDay.hourOfPeriod}:${timeOfDay.minute.toString().padLeft(2, '0')} ${timeOfDay.period.name}";
  }

  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlatformProvider>(context).isIOS)
        ? CupertinoPageScaffold(
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        date,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: CupertinoButton(
                      color: CupertinoColors.activeBlue,
                      onPressed: () async {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250,
                              color: CupertinoColors.black,
                              child: Column(
                                children: [
                                  Container(
                                    height: 190,
                                    child: CupertinoDatePicker(
                                      initialDateTime: dateTime,
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (DateTime picked) {
                                        setState(() {
                                          date =
                                              "${picked.day}/${picked.month}/${picked.year}";
                                        });
                                      },
                                    ),
                                  ),
                                  CupertinoButton(
                                    child: Text("Done",
                                        style: TextStyle(
                                            color: CupertinoColors.activeBlue)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text("Pick Date"),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        time,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: CupertinoButton(
                      color: CupertinoColors.activeBlue,
                      onPressed: () async {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250,
                              color: CupertinoColors.black,
                              child: Column(
                                children: [
                                  Container(
                                    height: 190,
                                    child: CupertinoDatePicker(
                                      initialDateTime: dateTime,
                                      mode: CupertinoDatePickerMode.time,
                                      onDateTimeChanged: (DateTime picked) {
                                        setState(() {
                                          time =
                                              "${picked.hour}:${picked.minute.toString().padLeft(2, '0')} ${picked.hour >= 12 ? 'PM' : 'AM'}";
                                        });
                                      },
                                    ),
                                  ),
                                  CupertinoButton(
                                    child: Text("Done",
                                        style: TextStyle(
                                            color: CupertinoColors.activeBlue)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text("Pick Time"),
                    ),
                  ),
                ],
              ),
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
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        date,
                        style: TextStyle(color: Colors.white, fontSize: 17),
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
                              (pickedDate != null) ? pickedDate! : dateTime,
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
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        time,
                        style: TextStyle(color: Colors.white, fontSize: 17),
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
                          context: context,
                          initialTime: timeOfDay,
                        );
                        setState(() {
                          if (pickedTime != null) {
                            time =
                                "${pickedTime!.hourOfPeriod}:${pickedTime!.minute.toString().padLeft(2, '0')} ${pickedTime!.period.name}";
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
