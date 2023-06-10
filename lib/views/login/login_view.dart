import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';

import '../task/task_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State {
  var checkPin = "Pin length is 6 digits";
  Color checkPinColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Text(
                  'Enter PIN',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  checkPin,
                  style: TextStyle(color: checkPinColor),
                ),
                const SizedBox(height: 60),
                Expanded(
                  child: PinCodeWidget(
                    filledIndicatorColor: Colors.redAccent,
                    numbersStyle: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    minPinLength: 6,
                    maxPinLength: 6,
                    onPressColorAnimation: Colors.redAccent,
                    onChangedPin: (pin) {},
                    onEnter: (pin, _) {
                      if (pin == "123456") {
                        Future.delayed(Duration.zero, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TaskView()),
                          );
                        });
                      } else {
                        checkPin = "Pin is not correct !!";
                        checkPinColor = Colors.redAccent;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
