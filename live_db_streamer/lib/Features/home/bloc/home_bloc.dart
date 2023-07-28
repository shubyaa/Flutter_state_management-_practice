import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_db_streamer/Database/db.dart';
import 'package:live_db_streamer/Features/home/bloc/home_event.dart';
import 'package:live_db_streamer/Features/home/bloc/home_state.dart';
import 'package:live_db_streamer/Models/user_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNavigateToSecondScreenEvent>(homeNavigateToSecondScreenEvent);
  }

  Future<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final users = await DatabaseMongo.getDocuments();
      emit(
        HomeLoadSuccessState(
          users: users
              .map(
                (e) => Users.fromJson(e),
              )
              .toList(),
        ),
      );
    } catch (e) {
      print(e);
      emit(HomeErrorState(error: e.toString()));
    }
  }

  FutureOr<void> homeNavigateToSecondScreenEvent(
      HomeNavigateToSecondScreenEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToSecondScreenState());
  }
}
