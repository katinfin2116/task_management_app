import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:task_management_app/views/login/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;
  final sessionStateStream = StreamController<SessionState>();

  @override
  Widget build(BuildContext context) {
    final sessionConfig = SessionConfig(
      invalidateSessionForAppLostFocus: const Duration(seconds: 10),
      invalidateSessionForUserInactivity: const Duration(seconds: 10),
    );
    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
      // stop listening, as user will already be in auth page
      sessionStateStream.add(SessionState.stopListening);
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
        // handle user  inactive timeout
        _navigator.push(MaterialPageRoute(
          builder: (_) => LoginView(
            sessionStateStream: sessionStateStream,
          ),
        ));
      } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        // handle user  app lost focus timeout
        _navigator.push(MaterialPageRoute(
          builder: (_) => LoginView(
            sessionStateStream: sessionStateStream,
          ),
        ));
      }
    });
    return SessionTimeoutManager(
      userActivityDebounceDuration: const Duration(seconds: 1),
      sessionConfig: sessionConfig,
      sessionStateStream: sessionStateStream.stream,
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKey,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginView(
              sessionStateStream: sessionStateStream,
            ),
          )),
    );
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Task Management',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: LoginView(),
    //   ),
    // );
  }
}
