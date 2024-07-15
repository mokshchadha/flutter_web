import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: StreamControllerExample(),
    );
  }
}

class StreamControllerExample extends StatefulWidget {
  @override
  _StreamControllerExampleState createState() =>
      _StreamControllerExampleState();
}

class _StreamControllerExampleState extends State<StreamControllerExample> {
  final StreamController<int> _controller = StreamController<int>();
  int _counter = 0;

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void _incrementCounter() {
    _counter++;
    _controller.sink.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StreamBuilder<int>(
          stream: _controller.stream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              return Text('Counter: ${snapshot.data}');
            } else {
              return const Text('Counter: 0');
            }
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Text('Increment Counter'),
        ),
      ],
    );
  }
}
