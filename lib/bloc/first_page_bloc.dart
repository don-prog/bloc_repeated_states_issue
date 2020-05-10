import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_repeated_states_issue/injection_container.dart';
import './bloc.dart';
import 'package:rxdart/rxdart.dart';

class FirstPageBloc extends Bloc<FirstPageEvent, FirstPageState> {
  @override
  FirstPageState get initialState => InitialFirstPageState();

  @override
  Stream<Transition<FirstPageEvent, FirstPageState>> transformEvents(
      Stream<FirstPageEvent> events, transitionFn) {
    final defferedEvents = events
        .where((e) => e is FirstFirstPageEvent)
        .debounceTime(const Duration(milliseconds: 250));
    final forwardedEvents = events.where((e) => e is! FirstFirstPageEvent);
    return super.transformEvents(
        forwardedEvents.mergeWith([defferedEvents]), transitionFn);
  }

  @override
  Stream<FirstPageState> mapEventToState(
    FirstPageEvent event,
  ) async* {
    if (event is FirstFirstPageEvent) {
      print('sl<MainBloc>().add(FirstMainEvent())');
      sl<MainBloc>().add(FirstMainEvent());
    }
  }
}
