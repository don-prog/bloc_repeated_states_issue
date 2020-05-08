import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_repeated_states_issue/injection_container.dart';
import './bloc.dart';

class FirstPageBloc extends Bloc<FirstPageEvent, FirstPageState> {
  @override
  FirstPageState get initialState => InitialFirstPageState();

  @override
  Stream<FirstPageState> mapEventToState(
      FirstPageEvent event,
      ) async* {
    if(event is FirstFirstPageEvent){
      print('sl<MainBloc>().add(FirstMainEvent())');
      sl<MainBloc>().add(FirstMainEvent());
    }
  }
}
