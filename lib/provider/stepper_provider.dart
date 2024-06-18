import 'package:flutter/material.dart';
import 'package:platformconverterapp/provider/contact_provider.dart';
import 'package:provider/provider.dart';

import '../model/chat.dart';

class StepperProvider extends ChangeNotifier {
  int step = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  String? imagePath;

  void forwardStep(BuildContext context) {
    if (step < 2) {
      step++;
    }
    notifyListeners();
  }

  void backwardStep() {
    if (step > 0) {
      step--;
    }
    notifyListeners();
  }

  void saveContact(BuildContext context) {
    if (nameController.text.isNotEmpty && contactController.text.isNotEmpty
        // imagePath != null
        ) {
      Contact contact = Contact(
        name: nameController.text,
        contact: contactController.text,
        imagePath: imagePath,
        // timestamp: DateTime(5),
      );
      Provider.of<ContactProvider>(context, listen: false).addContacts(contact);
      clearFields();
      Navigator.pop(context);
    }
  }

  void clearFields() {
    nameController.clear();
    contactController.clear();
    imagePath = null;
    step = 0;
    notifyListeners();
  }

  void setImagePath(String path) {
    imagePath = path;
    notifyListeners();
  }
}
