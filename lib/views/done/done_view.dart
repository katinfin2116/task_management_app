import 'package:flutter/material.dart';
class DoneView extends StatefulWidget {
  const DoneView({Key? key}) : super(key: key);

  @override
  State<DoneView> createState() => _DoneViewState();
}

class _DoneViewState extends State<DoneView> {
  @override
  Widget build(BuildContext context) {
    return Text("Done");
  }
}
