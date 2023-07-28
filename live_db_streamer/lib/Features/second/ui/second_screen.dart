import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Second Screen"),
        ),
        body: StreamBuilder(
            stream: getStreamUsers(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return Text("${snapshot.data}");
              } else {
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              }
            }),
      ),
    );
  }
}

Stream<int> getStreamUsers() {
  return Stream.periodic(Duration(seconds: 5), (int count) {
    return count;
  });
}
