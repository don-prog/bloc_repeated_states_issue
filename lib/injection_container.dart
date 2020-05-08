import 'dart:io';

import 'package:bloc_repeated_states_issue/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => MainBloc());

}