import 'package:flutter/material.dart';

@immutable
abstract class SecondScreenState {}

class SecondScreenInitialState extends SecondScreenState {}

class SecondScreenLoadingState extends SecondScreenState {}

class SecondScreenLoadingSuccessState extends SecondScreenState {}

class SecondScreenErrorState extends SecondScreenState {
  final String error;

  SecondScreenErrorState({required this.error});
}

class SecondScreenActionState extends SecondScreenState {}

//Add all the state that will take place after the UI / App is in Action State

class SecondScreenNavigateToState extends SecondScreenActionState {}
