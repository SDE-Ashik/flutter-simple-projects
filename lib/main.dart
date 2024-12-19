// import 'package:flutter/material.dart';
// import 'package:flutterproject/pages/login_page.dart';
// import 'package:flutterproject/pages/signup_pge.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:  RegistrationPage()
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutterproject/pages/login_page.dart';
import 'package:flutterproject/pages/signup_pge.dart';
import 'package:flutterproject/provider/login_provider.dart';
import 'package:flutterproject/provider/project_provider.dart';
import 'package:flutterproject/provider/registration_provider.dart';
import 'package:flutterproject/services/register_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// class ApiService {
//   Future<void> registerUser(
//       String username,
//       String password,
//       String confirmPassword,
//       String name,
//       String email,
//       String phoneNumber) async {
//     Uri url = Uri.parse("https://api.brandexperts.ae/api/register/");
//     print("hello");

//     var data = {
//       "username": username,
//       "password": password,
//       "confirm_password": confirmPassword,
//       "name": name,
//       "email": email,
//       "phone_number": phoneNumber,
//     };

//     try {
//       print("im");
//       var response = await http.post(url, body: data);
//       print("user");
//       print(response.body);
//       print(response.statusCode);
//       if (response.statusCode == 201) {
//         var jsonData = jsonDecode(response.body);
//         print("Success: $jsonData");
//       } else {
//         var error = jsonDecode(response.body);
//         print("Unable to register: ${error['error']}");
//         print("notfpound");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
// }

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegistrationProvider()),
             ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => ProjectProvider()),

        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   // final _confirmPasswordController = TextEditingController();
//   // final _nameController = TextEditingController();
//   // final _emailController = TextEditingController();
//   // final _phoneNumberController = TextEditingController();

//   bool _isLoading = false;

//   void _register() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       await ApiService().loginUser(
//         _usernameController.text,
//         _passwordController.text,
//       );

//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Register"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(labelText: "Username"),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter a username";
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: "Password"),
//                 obscureText: true,
//                 validator: (value) {
//                   // if (value == null || value.length < 6) {
//                   //   return "Password must be at least 6 characters";
//                   // }
//                   return null;
//                 },
//               ),
//               // TextFormField(
//               //   controller: _confirmPasswordController,
//               //   decoration: InputDecoration(labelText: "Confirm Password"),
//               //   obscureText: true,
//               //   validator: (value) {
//               //     if (value != _passwordController.text) {
//               //       return "Passwords do not match";
//               //     }
//               //     return null;
//               //   },
//               // ),
//               // TextFormField(
//               //   controller: _nameController,
//               //   decoration: InputDecoration(labelText: "Name"),
//               //   validator: (value) {
//               //     if (value == null || value.isEmpty) {
//               //       return "Please enter your name";
//               //     }
//               //     return null;
//               //   },
//               // ),
//               // TextFormField(
//               //   controller: _emailController,
//               //   decoration: InputDecoration(labelText: "Email"),
//               //   validator: (value) {
//               //     if (value == null || !value.contains('@')) {
//               //       return "Please enter a valid email";
//               //     }
//               //     return null;
//               //   },
//               // ),
//               // TextFormField(
//               //   controller: _phoneNumberController,
//               //   decoration: InputDecoration(labelText: "Phone Number"),
//               //   validator: (value) {
//               //     if (value == null || value.isEmpty) {
//               //       return "Please enter your phone number";
//               //     }
//               //     return null;
//               //   },
//               // ),

//               SizedBox(height: 20),
//               _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : ElevatedButton(
//                       onPressed: _register,
//                       child: Text("login"),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutterproject/pages/home_page.dart';
// import 'package:http/http.dart' as http;

// void main() => runApp(ProjectApp());

// class ProjectApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class ProjectListPage extends StatefulWidget {
//   @override
//   _ProjectListPageState createState() => _ProjectListPageState();
// }

// class _ProjectListPageState extends State<ProjectListPage> {
//   Future<List<dynamic>> fetchProjects() async {
//     final url = Uri.parse('https://api.brandexperts.ae/api/projects/');
//     final response = await http.get(
//       url,
//       headers: {
//         'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM3MjI5Mjc5LCJpYXQiOjE3MzQ2MzcyNzksImp0aSI6ImNjMGUwNWM0ZWM1MjRiZDJhNGUwYTUzMjY5ZjJhMTBjIiwidXNlcl9pZCI6MTZ9.VwN7TjfebbaMl4j_AsMcRH4K4FnUrL_T7CYtIpFVytA',
//       },
//     );

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else if (response.statusCode == 401) {
//       throw Exception('Unauthorized: Check your token');
//     } else {
//       throw Exception(
//           'Failed to load projects. Status code: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Projects'),
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: fetchProjects(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No projects found'));
//           } else {
//             final projects = snapshot.data!;
//             return ListView.builder(
//               itemCount: projects.length,
//               itemBuilder: (context, index) {
//                 final project = projects[index];
//                 return Card(
//                   child: ListTile(
//                     title: Text(project['name']),
//                     subtitle: Text(project['description']),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
