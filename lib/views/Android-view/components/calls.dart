import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/callprovider.dart';
import '../../../provider/platform_provider.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> callHistory = [
      {'name': 'Bruce Wayne', 'contact': '+1 234 567 890', 'time': '09:15'},
      {'name': 'Clark Kent', 'contact': '+1 987 654 321', 'time': '08:30'},
      {'name': 'Diana Prince', 'contact': '+1 456 789 012', 'time': '14:45'},
      {'name': 'Barry Allen', 'contact': '+1 321 654 987', 'time': '16:20'},
      {'name': 'Arthur Curry', 'contact': '+1 123 987 654', 'time': '17:05'},
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: (Provider.of<PlatformProvider>(context).isIOS)
          ? CupertinoPageScaffold(
              child: SafeArea(
                child: ListView.builder(
                  itemCount: callHistory.length,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  itemBuilder: (context, index) {
                    final call = callHistory[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey5,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.phone_fill,
                                  color: CupertinoColors.systemGreen,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      call['name']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: CupertinoColors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      call['contact']!,
                                      style: TextStyle(
                                        color: CupertinoColors.inactiveGray,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              call['time']!,
                              style: TextStyle(
                                color: CupertinoColors.inactiveGray,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          : Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Call History",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Consumer<CallProvider>(
                  builder: (context, callProvider, _) {
                    return ListView.builder(
                      itemCount: callProvider.callHistory.length,
                      itemBuilder: (context, index) {
                        final call = callProvider.callHistory[index];
                        return ListTile(
                          title: Text(
                            call.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            call.contact,
                            style: const TextStyle(color: Colors.white70),
                          ),
                          trailing: Text(
                            "${call.timestamp.hour}:${call.timestamp.minute}",
                            style: const TextStyle(color: Colors.white54),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
    );
  }
}
