import 'package:bloc_repeated_states_issue/bloc/bloc.dart';
import 'package:bloc_repeated_states_issue/bloc/main_bloc.dart';
import 'package:bloc_repeated_states_issue/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  FirstPageBloc _firstPageBloc;

  @override
  void initState() {
    super.initState();

    _firstPageBloc = BlocProvider.of<FirstPageBloc>(context);

    print('_firstPageBloc.add(FirstFirstPageEvent())');
    _firstPageBloc.add(FirstFirstPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody(){
    print('FirstPage.buildBody()');
    return Container(
      child: BlocListener<MainBloc, MainState>(
        listener: (context, state){
          if(state is FirstMainState)
            print('First page received FirstState');
        },
        child: Center(
          child: RaisedButton(
            child: Text('Go to second page'),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacementNamed('second_page');
            },
          ),
        ),
      ),
    );
  }
}