import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/platform_provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<PlatformProvider>(context).isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text("Profile"),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4oz0KdCvHj_hvY5exy-qFr06SPFjyA4ZoPg&s",
                    ),
                  ),
                  SizedBox(height: 15),
                  // User Name
                  Text(
                    "Veera",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "veera@gmail.com",
                    style: TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  SizedBox(height: 20),
                  CupertinoListSection(
                    header: Text("Information"),
                    children: [
                      CupertinoListTile(
                        leading: Icon(CupertinoIcons.phone,
                            color: CupertinoColors.activeGreen),
                        title: Text("8787612145"),
                        subtitle: Text("Mobile"),
                        trailing: Icon(CupertinoIcons.chevron_right),
                        onTap: () {},
                      ),
                      CupertinoListTile(
                        leading: Icon(CupertinoIcons.mail,
                            color: CupertinoColors.activeBlue),
                        title: Text("veera@gmail.com"),
                        subtitle: Text("Email"),
                        trailing: Icon(CupertinoIcons.chevron_right),
                        onTap: () {},
                      ),
                      CupertinoListTile(
                        leading: Icon(CupertinoIcons.info,
                            color: CupertinoColors.activeOrange),
                        title: Text("Available"),
                        subtitle: Text("Status"),
                        trailing: Icon(CupertinoIcons.chevron_right),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 20, top: 50),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4oz0KdCvHj_hvY5exy-qFr06SPFjyA4ZoPg&s",
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Veera",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.greenAccent),
                  title: Text(
                    "8787612145",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  subtitle: Text(
                    "Mobile",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                Divider(color: Colors.grey[800]),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.greenAccent),
                  title: Text(
                    "veera@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  subtitle: Text(
                    "Email",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                Divider(color: Colors.grey[800]),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.greenAccent),
                  title: Text(
                    "Available",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  subtitle: Text(
                    "Status",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                Divider(color: Colors.grey[800]),
              ],
            ),
          );
  }
}
