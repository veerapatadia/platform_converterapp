import 'package:platformconverterapp/views/Android-view/components/calls.dart';
import 'package:platformconverterapp/views/Android-view/components/chats.dart';
import 'package:platformconverterapp/views/Android-view/components/settings.dart';

import '../views/Android-view/components/Profile.dart';

List<Map<String, dynamic>> allComponents = [
  {
    'label': "Chats",
    'widget': Chats(),
  },
  {
    'label': "Calls",
    'widget': Calls(),
  },
  {
    'label': "Settings",
    'widget': Settings(),
  },
  {
    'label': "Profile",
    'widget': Profile(),
  },
];
