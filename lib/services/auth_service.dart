import 'package:get/get.dart';

import '../views/login/login_view.dart';

/// For managing the authentication logic
class AuthService {
  bool isUserLoggedIn() {
    // Update as per logged in logic
    return true;
  }

  void logoutUser({String? reason}) {
    // Logout the user
    Get.offAll(LoginView());
    print('Logged Out: $reason');
  }
}
