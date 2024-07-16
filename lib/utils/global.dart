import 'package:platformconverterapp/views/Android-view/components/calls.dart';
import 'package:platformconverterapp/views/Android-view/components/chats.dart';
import 'package:platformconverterapp/views/Android-view/components/settings.dart';
import 'package:platformconverterapp/views/Android-view/components/updates.dart';

List<Map<String, dynamic>> allComponents = [
  {
    'label': "Chats",
    'widget': Chats(),
  },
  {
    'label': "Updates",
    'widget': ChatPage(),
  },
  {
    'label': "Calls",
    'widget': Calls(),
  },
  {
    'label': "Settings",
    'widget': Settings(),
  }
];
