// lib/Calls.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: Card(
          elevation: 3,
          child: ListTile(
            title: Text("Veera"),
            subtitle: Text("8787612145"),
            // trailing: Text(
            // "${call.timestamp.hour}:${call.timestamp.minute}",
            // style: TextStyle(fontSize: 12),
            // ),
          ),
        ),
      ),
    );
  }
}
