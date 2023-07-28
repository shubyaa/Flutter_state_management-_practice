import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_db_streamer/Features/home/bloc/home_bloc.dart';
import 'package:live_db_streamer/Features/home/bloc/home_event.dart';
import 'package:live_db_streamer/Features/home/bloc/home_state.dart';
import 'package:live_db_streamer/Features/second/ui/second_screen.dart';
import 'package:live_db_streamer/components/user_card.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    // This is initial state invocation where you can liftup your state and execut it's bloc operation to emit other states
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          listener: (context, state) {
            if (state is HomeNavigateToSecondScreenState) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              );
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeLoadingState:
                return Center(
                  child: Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey[850],
                      ),
                    ),
                  ),
                );

              case HomeLoadSuccessState:
                final successState = state as HomeLoadSuccessState;
                return Scaffold(
                  appBar: AppBar(
                    title: const Text("First Screen"),
                    actions: [
                      IconButton(
                          onPressed: () {
                            homeBloc.add(HomeNavigateToSecondScreenEvent());
                          },
                          icon: const Icon(Icons.arrow_right_alt_outlined))
                    ],
                  ),
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: Colors.grey[600],
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                        homeBloc.add(HomeNavigateToSecondScreenEvent()),
                  ),
                  body: ListView.builder(
                      itemCount: successState.users.length,
                      itemBuilder: (context, index) {
                        return UserCard(user: successState.users[index]);
                      }),
                );

              case HomeErrorState:
                final errorState = state as HomeErrorState;
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
        ),
      ),
    );
  }
}
