import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:task_management_app/views/todo/todo_view.dart';

import '../task/task_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Text('Pin length is 6 digits'),
            const SizedBox(height: 60),
            Expanded(
              child: PinCodeWidget(
                filledIndicatorColor : Colors.redAccent,
                numbersStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                minPinLength: 6,
                maxPinLength: 6,
                onPressColorAnimation: Colors.redAccent,
                onChangedPin: (pin) {
                },
                onEnter: (pin, _) {
                  if(pin == "123456"){
                    Future.delayed(Duration.zero, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaskView()),
                      );
                    });
                  }
                },
                // centerBottomWidget: IconButton(
                //   icon: const Icon(
                //     Icons.fingerprint,
                //     size: 40,
                //   ),
                //   onPressed: () {},
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
