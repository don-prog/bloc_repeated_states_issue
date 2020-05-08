import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
        automaticallyImplyLeading: true,
      ),
      body: const _SecondPageBody(),
    );
  }
}

class _SecondPageBody extends StatelessWidget {
  const _SecondPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Go to first page'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
