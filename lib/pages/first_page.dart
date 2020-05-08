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

    print('_FirstPageState.initState');
    print('_firstPageBloc.add(FirstFirstPageEvent())');
    _firstPageBloc.add(FirstFirstPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: const _FirstPageBody(),
    );
  }
}

class _FirstPageBody extends StatelessWidget {
  const _FirstPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {
        if (state is FirstMainState) print('First page received FirstState');
      },
      child: Center(
        child: RaisedButton(
          child: Text('Go to second page'),
          onPressed: () async {
            final result = await Navigator.of(context).pushNamed('second_page');
            context.bloc<FirstPageBloc>().add(SecondPagePopped());
          },
        ),
      ),
    );
  }
}
