import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../views/login/login_view.dart';
import 'auth_service.dart';

/// Service for handling user auto logout based on user activity
class AutoLogoutService {
  static Timer? _timer;
  static const autoLogoutTimer = 10;
  final AuthService _authService = AuthService();

  void startNewTimer() {
    stopTimer();
    if (_authService.isUserLoggedIn()) {
      _timer = Timer.periodic(const Duration(seconds: autoLogoutTimer), (_) {
        timedOut();
      });
    }
  }

  void stopTimer() {
    if (_timer != null || (_timer?.isActive != null && _timer!.isActive)) {
      _timer?.cancel();
    }
  }

  void trackUserActivity([_]) async {
    if (_authService.isUserLoggedIn() && _timer != null) {
      startNewTimer();
    }
  }

  /// Called if the user is inactive for a period of time and opens a dialog
  Future<void> timedOut() async {
    stopTimer();
    if (_authService.isUserLoggedIn()) {
      _authService.logoutUser(reason: 'auto-logout');

    }
  }
}
