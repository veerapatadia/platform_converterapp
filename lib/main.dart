import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platformconverterapp/provider/bottom_provider.dart';
import 'package:platformconverterapp/provider/contact_provider.dart';
import 'package:platformconverterapp/provider/image_provider.dart';
import 'package:platformconverterapp/provider/platform_provider.dart';
import 'package:platformconverterapp/provider/stepper_provider.dart';
import 'package:platformconverterapp/views/Android-view/homepage/screens/homepage_android.dart';
import 'package:platformconverterapp/views/IOS-view/homepage_IOS.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    myApp(),
  );
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PlatformProvider()),
          ChangeNotifierProvider(create: (context) => StepperProvider()),
          ChangeNotifierProvider(create: (context) => BottomProvider()),
          ChangeNotifierProvider(create: (context) => ContactProvider()),
          ChangeNotifierProvider(create: (context) => imageProvider()),
        ],
        builder: (context, _) {
          return (Provider.of<PlatformProvider>(context).isIOS)
              ? CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  routes: {
                    '/': (context) => homepage_IOS(),
                  },
                )
              : MaterialApp(
                  debugShowCheckedModeBanner: false,
                  routes: {
                    '/': (context) => homepage_Android(),
                  },
                );
        });
  }
}
