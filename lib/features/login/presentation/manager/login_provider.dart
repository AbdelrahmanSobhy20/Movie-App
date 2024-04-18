import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // void loginUser(BuildContext context,
  //     {required String username, required String password}) async {
  //   try {
  //     isLoading = true;
  //     final response = await
  //   }
  // }
}