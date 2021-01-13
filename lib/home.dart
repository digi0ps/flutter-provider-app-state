import 'package:flutter/material.dart';
import 'package:flutter_app/state/messages.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Test App'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to my first app'),
              Text('what up'),
              Container(
                margin: EdgeInsets.all(20),
              ),
              CounterWidget(),
              _MessagesList(),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.airplanemode_active, size: 25),
        onPressed: () {
          Navigator.pushNamed(context, '/input');
        },
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int times = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text('You are happy $times times'),
          RaisedButton(
            onPressed: () {
              setState(() {
                times += 1;
              });
            },
            child: Text('Get happy once more'),
          )
        ]
    );
  }
}

class _MessagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MessageModel>(
      builder: (context, state, child) {
        var msgs = state.messages;
        print('Messages: ${msgs}');
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: msgs.length,
          itemBuilder: (BuildContext context, int index) => Center(
          child: Text(
            '${msgs[index]}'
          ),
          )
        );
      }
    );
  }
}
