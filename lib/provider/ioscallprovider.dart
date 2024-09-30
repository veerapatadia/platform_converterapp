import 'package:flutter/material.dart';

class CallHistory {
  final String name;
  final String contact;
  final DateTime timestamp;

  CallHistory({
    required this.name,
    required this.contact,
    required this.timestamp,
  });
}

class Ioscallprovider with ChangeNotifier {
  final List<CallHistory> _callHistory = [];

  List<CallHistory> get callHistory => _callHistory;

  void addCallHistory(CallHistory call) {
    _callHistory.add(call);
    notifyListeners();
  }
}
