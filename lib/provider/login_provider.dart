// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:flutterproject/services/register_service.dart';
// import '../model/login_model.dart';

// class LoginProvider extends ChangeNotifier {
//   final ApiService _apiService = ApiService();

//   bool _isLoading = false;
//   String _errorMessage = '';
//   bool _isLoggedIn = false;

//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;
//   bool get isLoggedIn => _isLoggedIn;

//   Future<bool> login(LoginModel model) async {
//     _isLoading = true;
//     _errorMessage = '';
//     notifyListeners();

//     try {
//       final response = await _apiService.loginUser(model);
//       if (response != null && response.statusCode == 200) {
//         _isLoggedIn = true;
//         print("User data: ${response.data}");
//         return true;
//       } else {
//         _errorMessage = "Invalid username or password.";
//       }
//     } catch (e) {
//       _errorMessage = "An error occurred during login.";
//       print(e);
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../services/register_service.dart';
import '../model/login_model.dart';

class LoginProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  String _errorMessage = '';
  bool _isLoggedIn = false;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(LoginModel model) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await _apiService.loginUser(model);

      if (response != null && response.statusCode == 200) {
        _isLoggedIn = true;
        notifyListeners();
        print("User data: ${response.data}");
        return true;
      } else {
        _errorMessage = response?.data['error'] ??
            "Invalid username or password."; // Custom error message from API
      }
    } on DioError catch (e) {
      // Handle Dio-specific errors
      _errorMessage = e.response?.data['error'] ??
          "Network error: ${e.message}. Please try again.";
      print("DioError: ${e.response?.data}");
    } catch (e) {
      // Handle unexpected errors
      _errorMessage = "An unexpected error occurred.";
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return false;
  }
}
