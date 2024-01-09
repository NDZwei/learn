import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: CustomStateLessWidget(),
        ),
      )));
}

// Color
// Co/khong child
// Size: width, height
// alignment: Alignment, AlignmentDirectional, FactionalOffset: su dung de can chinh item trong container
// padding, margin
// decoration: color, shape, borderRadius, border
// transform
class CustomStateLessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 200,
      height: 100,
      alignment: Alignment.centerLeft,
      transform: Matrix4.rotationZ(0.2),
      // padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   color: Colors.red,
      //   shape: BoxShape.rectangle,
      //   borderRadius: const BorderRadius.all(Radius.circular(20)),
      //   border: Border.all(width: 2, color: Colors.black)
      // ),
      child: const Text(
        "Hello",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
