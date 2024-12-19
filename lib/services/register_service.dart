// // // // Inside your ApiService class, modify the registerUser method to print the error details.
// // // import 'package:dio/dio.dart';
// // // import 'package:flutterproject/model/registration_model.dart';

// // // class ApiService {
// // //   final Dio _dio = Dio();

// // //   Future<Response?> registerUser(RegistrationModel model) async {
// // //     const String apiUrl = 'https://api.brandexperts.ae/api/register/';
// // //     try {
// // //       final response = await _dio.post(
// // //         apiUrl,
// // //         data: model.toJson(),
// // //         options: Options(
// // //           headers: {'Content-Type': 'application/json'},
// // //         ),
// // //       );
// // //       return response;
// // //     } catch (e) {
// // //       if (e is DioError) {
// // //         print("Error during registration: ${e.response?.data}");
// // //         print("Status Code: ${e.response?.statusCode}");
// // //         print("Message: ${e.message}");
// // //       } else {
// // //         print("Unexpected error: $e");
// // //       }
// // //       return null;
// // //     }
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // class ApiService {
// //   Future<void> registerUser(
// //       String username,
// //       String password,
// //       String confirmPassword,
// //       String name,
// //       String email,
// //       String phoneNumber) async {
// //     Uri url = Uri.parse("https://api.brandexperts.ae/api/register/");
// //     print("hello");

// //     var data = {
// //       "username": username,
// //       "password": password,
// //       "confirm_password": confirmPassword,
// //       "name": name,
// //       "email": email,
// //       "phone_number": phoneNumber,
// //     };

// //     try {
// //       print("im");
// //       var response = await http.post(url, body: data);
// //       print("user");
// //       print(response.body);
// //       print(response.statusCode);
// //       if (response.statusCode == 201) {
// //         var jsonData = jsonDecode(response.body);
// //         print("Success: $jsonData");
// //       } else {
// //         var error = jsonDecode(response.body);
// //         print("Unable to register: ${error['error']}");
// //         print("notfpound");
// //       }
// //     } catch (e) {
// //       print("Error: $e");
// //     }
// //   }
// //    Future<void> loginUser(
// //       String username,
// //       String password,

// //      ) async {
// //     Uri url = Uri.parse("https://api.brandexperts.ae/api/login/");
// //     print("hello");

// //     var data = {
// //       "username": username,
// //       "password": password,

// //     };

// //     try {

// //       var response = await http.post(url, body: data);

// //       print(response.body);
// //       print(response.statusCode);
// //       if (response.statusCode == 200) {
// //         var jsonData = jsonDecode(response.body);
// //         print("Success: $jsonData");
// //       } else {
// //         var error = jsonDecode(response.body);
// //         print("Unable to register: ${error['error']}");
// //         print("notfpound");
// //       }
// //     } catch (e) {
// //       print("Error: $e");
// //     }
// //   }
// // }

// // API Service
// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutterproject/model/registration_model.dart';

// class ApiService {
//   final Dio _dio = Dio();
//   late var registration_token;

//   // Register User
//   Future<void> registerUser(RegistrationModel model) async {
//     const String apiUrl = "https://api.brandexperts.ae/api/register/";
//     try {
//       final response = await _dio.post(
//         apiUrl,
//         data: model.toJson(),
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//         ),
//       );
//       registration_token = response;
//       if (response.statusCode == 201) {
//         print("Registration Successful: ${response.data}");
//       } else {
//         print("Registration Failed: ${response.data}");
//       }
//     } catch (e) {
//       if (e is DioError) {
//         print("Error during registration: ${e.response?.data}");
//         print("Status Code: ${e.response?.statusCode}");
//         print("Message: ${e.message}");
//       } else {
//         print("Unexpected error: $e");
//       }
//     }
//   }

//   // Login User
//   Future<void> loginUser(String username, String password) async {
//     const String apiUrl = "https://api.brandexperts.ae/api/login/";
//     var data = {"username": username, "password": password};

//     try {
//       var response = await _dio.post(
//         apiUrl,
//         data: jsonEncode(data),
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//         ),
//       );

//       if (response.statusCode == 200) {
//         print("Login Successful: ${response.data}");
//       } else {
//         print("Login Failed: ${response.data}");
//       }
//     } catch (e) {
//       if (e is DioError) {
//         print("Error during login: ${e.response?.data}");
//         print("Status Code: ${e.response?.statusCode}");
//         print("Message: ${e.message}");
//       } else {
//         print("Unexpected error: $e");
//       }
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutterproject/model/login_model.dart';
import 'package:flutterproject/model/registration_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> registerUser(RegistrationModel model) async {
    const String apiUrl = "https://api.brandexperts.ae/api/register/";

    try {
      final response = await _dio.post(
        apiUrl,
        data: model.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 201) {
        print("Registration Successful: ${response.data}");
        return response;
      } else {
        print("Registration Failed: ${response.data}");
        return null;
      }
    } catch (e) {
      if (e is DioError) {
        print("Error during registration: ${e.response?.data}");
        print("Status Code: ${e.response?.statusCode}");
        print("Message: ${e.message}");
        return e.response; // Returning the error response
      } else {
        print("Unexpected error: $e");
        return null;
      }
    }
  }
  Future<Response?> loginUser(LoginModel model) async {
    const String apiUrl = "https://api.brandexperts.ae/api/login/";

    try {
      final response = await _dio.post(
        apiUrl,
        data: model.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        print("Login Successful: ${response.data}");
        return response;
      } else {
        print("Login Failed: ${response.data}");
        return null;
      }
    } catch (e) {
      if (e is DioError) {
        print("Error during login: ${e.response?.data}");
        print("Status Code: ${e.response?.statusCode}");
        print("Message: ${e.message}");
        return e.response;
      } else {
        print("Unexpected error: $e");
        return null;
      }
    }
  }

}
