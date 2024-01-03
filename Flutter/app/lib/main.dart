import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: Scaffold(
        body: Center(
          child: CustomStateLessWidget(true),
        )
      ),
    )
  ));
}


class CustomStateLessWidget extends StatelessWidget {
  final bool loading;

  CustomStateLessWidget(this.loading);

  @override
  Widget build(BuildContext context) {
    return loading ? const CircularProgressIndicator() : const Text("Loading...");
  }
}

class CustomStateFullWidget extends StatefulWidget {
  final bool loading;

  CustomStateFullWidget(this.loading);

  @override
  State<StatefulWidget> createState() {
    return StateForStatefulWidget();
  }
}

class StateForStatefulWidget extends State<CustomStateFullWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.loading ? const CircularProgressIndicator() : const Text("Loading...");
  }

}