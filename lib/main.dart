
import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/input.dart';
import 'package:flutter_app/state/messages.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessageModel(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyHome(),
          '/input': (context) => MyInput(),
        },
      ),
    );
  }
}
