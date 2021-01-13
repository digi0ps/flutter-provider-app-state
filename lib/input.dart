import 'package:flutter/material.dart';
import 'package:flutter_app/state/messages.dart';
import 'package:provider/provider.dart';

class MyInput extends StatefulWidget {
  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  final myController = TextEditingController();


  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Hello lua',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'sans-serif',
                )
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: 'Enter your input',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  labelText: 'Message',
                ),
                style: TextStyle(
                  color: Colors.white,
                  decorationColor: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              child: Icon(
                  Icons.insert_comment,
                  color: Colors.white,
              ),
              onPressed: () {
                final messages = context.read<MessageModel>();
                print("input: ${myController.text}");
                messages.add(myController.text);
                Navigator.pushNamed(context, '/');
              },
              color: Colors.red,
            )
          ],
        )
      ),
      backgroundColor: Colors.black,
    );
  }
}
