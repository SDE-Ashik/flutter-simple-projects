// import 'package:flutter/material.dart';
// import 'package:flutterproject/model/registration_model.dart';
// import 'package:flutterproject/services/register_service.dart';

// class RegistrationProvider with ChangeNotifier {
//   final ApiService _apiService = ApiService();

//   bool _isLoading = false;
//   String _errorMessage = '';

//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;

//   Future<bool> registerUser(RegistrationModel model) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       final  response = _apiService.registration_token;

//       if (response != null && response.statusCode == 200) {
//         _isLoading = false;
//         notifyListeners();
//         return true;
//       } else {
//         _errorMessage = 'Registration failed';
//       }
//     } catch (e) {
//       _errorMessage = 'An error occurred: $e';
//     }

//     _isLoading = false;
//     notifyListeners();
//     return false;
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutterproject/model/registration_model.dart';
import 'package:flutterproject/services/register_service.dart';

class RegistrationProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<bool> registerUser(RegistrationModel model) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await _apiService.registerUser(model);

      if (response != null && response.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response?.data['message'] ?? 'Registration failed';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}
