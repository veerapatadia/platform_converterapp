import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/callprovider.dart';
import '../../../provider/ioscallprovider.dart';
import '../../../provider/platform_provider.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: (Provider.of<PlatformProvider>(context).isIOS)
          ? CupertinoPageScaffold(child: Consumer<CallProvider>(
              builder: (context, iosCallProvider, _) {
                return ListView.builder(
                  itemCount: iosCallProvider.callHistory.length,
                  itemBuilder: (context, index) {
                    final call = iosCallProvider.callHistory[index];
                    return ListTile(
                      title: Text(
                        call.name,
                        style: TextStyle(color: CupertinoColors.white),
                      ),
                      subtitle: Text(
                        call.contact,
                        style: TextStyle(color: CupertinoColors.white),
                      ),
                      trailing: Text(
                        "${call.timestamp.hour}:${call.timestamp.minute}",
                        style: TextStyle(color: CupertinoColors.white),
                      ),
                    );
                  },
                );
              },
            ))
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
                Expanded(
                  child: Consumer<CallProvider>(
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
                ),
              ],
            ),
    );
  }
}
