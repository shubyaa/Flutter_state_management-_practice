import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_db_streamer/Features/second/bloc/second_screen_bloc.dart';
import 'package:live_db_streamer/Features/second/bloc/second_screen_event.dart';
import 'package:live_db_streamer/Features/second/bloc/second_screen_state.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  SecondScreenBloc secondScreenBloc = SecondScreenBloc();

  @override
  void initState() {
    secondScreenBloc.add(SecondScreenInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SecondScreenBloc, SecondScreenState>(
      bloc: secondScreenBloc,
      listenWhen: (previous, current) => current is SecondScreenActionState,
      buildWhen: (previous, current) => current is! SecondScreenActionState,
      listener: (context, state) {
        //All listeners essentially those who are child of ActionState because
        // we make sure that Bloc listens only when we have current state as SecondScreenActionState
      },
      builder: (context, state) {
        print(state.runtimeType.toString());
        switch (state.runtimeType) {
          case SecondScreenLoadingState:
            return Center(
              child: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.red[850],
                  ),
                ),
              ),
            );

          case SecondScreenLoadingSuccessState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Second Screen"),
              ),
              body: const Center(
                child: Text("Hi this is SecondScreen"),
              ),
            );

          case SecondScreenErrorState:
            final errorState = state as SecondScreenErrorState;
            return Scaffold(
              body: Center(
                child: Text(
                    "Something went wrong, the error is ${errorState.error}"),
              ),
            );

          default:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
            );
        }
      },
    );
  }
}
