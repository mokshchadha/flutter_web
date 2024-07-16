import 'package:flutter/material.dart';

class InputDisplayScreen extends StatefulWidget {
  @override
  _InputDisplayScreenState createState() => _InputDisplayScreenState();
}

class _InputDisplayScreenState extends State<InputDisplayScreen> {
  final TextEditingController _controller = TextEditingController();
  String _displayedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Display Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter text',
              ),
              onChanged: (String text) {
                setState(() {
                  _displayedText = text;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'You typed: $_displayedText',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
