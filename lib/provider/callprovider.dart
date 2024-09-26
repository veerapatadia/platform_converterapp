import 'package:flutter/cupertino.dart';
import '../model/call.dart';
import '../model/chat.dart';

class CallProvider extends ChangeNotifier {
  List<Contact> allContact = [];
  List<CallHistory> callHistory = [];

  void addCallHistory(CallHistory call) {
    callHistory.add(call);
    notifyListeners();
  }

  void deleteContacts(Contact contact) {
    allContact.remove(contact);
    notifyListeners();
  }
}
