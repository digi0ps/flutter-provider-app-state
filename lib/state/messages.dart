

import 'package:flutter/material.dart';

class MessageModel extends ChangeNotifier {
  List<String> messages = [];

  void add(String msg) {
    messages.add(msg);
    print('added');
    notifyListeners();
  }
}