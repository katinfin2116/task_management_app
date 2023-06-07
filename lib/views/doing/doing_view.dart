import 'package:flutter/material.dart';
class DoingView extends StatefulWidget {
  const DoingView({Key? key}) : super(key: key);

  @override
  State<DoingView> createState() => _DoingViewState();
}

class _DoingViewState extends State<DoingView> {
  @override
  Widget build(BuildContext context) {
    return Text("Doing");
  }
}
