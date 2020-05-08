import 'package:bloc_repeated_states_issue/bloc/main_bloc.dart';
import 'package:bloc_repeated_states_issue/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ),
      body: buildBody(),
    );
  }



  Widget buildBody(){
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('Go to first page'),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.of(context).pushReplacementNamed('first_page');
          },
        ),
      ),
    );
  }
}