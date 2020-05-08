import 'package:meta/meta.dart';

@immutable
abstract class FirstPageEvent {}

class FirstFirstPageEvent extends FirstPageEvent {}

class SecondPagePopped extends FirstPageEvent {}
