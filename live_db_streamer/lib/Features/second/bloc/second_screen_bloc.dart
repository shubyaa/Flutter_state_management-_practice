import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_db_streamer/Features/second/bloc/second_screen_event.dart';
import 'package:live_db_streamer/Features/second/bloc/second_screen_state.dart';

class SecondScreenBloc extends Bloc<SecondScreenEvent, SecondScreenState> {
  SecondScreenBloc() : super(SecondScreenInitialState()) {
    on<SecondScreenInitialEvent>(secondScreenInitialEvent);
    on<SecondScreenNavigateEvent>(secondScreenNavigateEvent);
  }

  FutureOr<void> secondScreenInitialEvent(
      SecondScreenInitialEvent event, Emitter<SecondScreenState> emit) async {
    emit(SecondScreenLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(SecondScreenLoadingSuccessState());
  }

  FutureOr<void> secondScreenNavigateEvent(
      SecondScreenNavigateEvent event, Emitter<SecondScreenState> emit) {
    emit(SecondScreenNavigateToState());
  }
}
