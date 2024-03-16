import 'package:flutter/material.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/pages/home_page.dart';
import 'package:amritha_ayurveda/feactures/authentication/presentation/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  Widget _initialWidget = const LoginPage();
  Widget get initialWidget => _initialWidget;
  void authRedirect(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") != null) {
      _initialWidget = const HomePage();
      notifyListeners();
    } else {
      _initialWidget = const LoginPage();
      notifyListeners();
    }
  }
}
