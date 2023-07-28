import 'package:flutter/material.dart';
import 'package:live_db_streamer/Models/user_model.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadSuccessState extends HomeState {
  final List<Users> users;
  HomeLoadSuccessState({required this.users});
}

class HomeActionState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState({required this.error});
}

// Naigation States
// Note : Since our UI will be built before this State, so our app will be in
// Action i.e. => HomeActionState, so rest all navigating and interacting states
// will be the child of HomeActionState and not HomeState

class HomeNavigateToSecondScreenState extends HomeActionState {}
