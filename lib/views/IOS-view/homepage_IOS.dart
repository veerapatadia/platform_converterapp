import 'package:flutter/cupertino.dart';
import 'package:platformconverterapp/provider/platform_provider.dart';
import 'package:platformconverterapp/utils/global.dart';
import 'package:provider/provider.dart';

class homepage_IOS extends StatefulWidget {
  const homepage_IOS({super.key});

  @override
  State<homepage_IOS> createState() => _homepage_IOSState();
}

class _homepage_IOSState extends State<homepage_IOS> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: "Calls",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text(
                  "Homepage",
                  style: TextStyle(color: CupertinoColors.white),
                ),
                backgroundColor: CupertinoColors.black,
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Provider.of<PlatformProvider>(context, listen: false)
                        .changePlatform();
                  },
                  child: const Icon(
                    CupertinoIcons.arrow_2_circlepath_circle,
                    color: CupertinoColors.white,
                  ),
                ),
              ),
              child: Center(
                child: _getPageContent(index),
              ),
            );
          },
        );
      },
    );
  }

  Widget _getPageContent(int index) {
    final component = allComponents[index]['widget'];
    return component is Widget ? component : Text("Page not available");
  }
}
