import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeNavigateToSecondScreenEvent extends HomeEvent {}
