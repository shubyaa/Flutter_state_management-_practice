import 'package:flutter/material.dart';

@immutable
abstract class SecondScreenEvent {}

class SecondScreenInitialEvent extends SecondScreenEvent {}

class SecondScreenNavigateEvent extends SecondScreenEvent {}
