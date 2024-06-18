import 'package:flutter/material.dart';
import 'package:platformconverterapp/provider/bottom_provider.dart';
import 'package:platformconverterapp/provider/platform_provider.dart';
import 'package:platformconverterapp/utils/global.dart';
import 'package:provider/provider.dart';

class homepage_Android extends StatefulWidget {
  const homepage_Android({super.key});

  @override
  State<homepage_Android> createState() => _homepage_AndroidState();
}

class _homepage_AndroidState extends State<homepage_Android> {
  PageController pageController = PageController();
  int bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home page",
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<PlatformProvider>(context, listen: false)
                  .changePlatform();
            },
            icon: Icon(
              Icons.change_circle,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (val) {
          Provider.of<BottomProvider>(context, listen: false)
              .bottomNavigation(val);
          // setState(() {
          //   bottomNavIndex = val;
          // });
        },
        children: [
          ...allComponents.map((e) => e['widget']),
        ],
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar:
          Consumer<BottomProvider>(builder: (context, bottomProvider, _) {
        return BottomNavigationBar(
          currentIndex: bottomProvider.bottomNavIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          onTap: (val) {
            bottomProvider.bottomNavigation(val);
            // setState(() {
            //   bottomNavIndex = val;
            // });
            pageController.animateToPage(
              val,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chats",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.update),
              label: "Updates",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: "Calls",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: Colors.transparent,
            ),
          ],
        );
      }),
    );
  }
}
