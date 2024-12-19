import 'package:flutter/material.dart';
import 'package:flutterproject/model/login_model.dart';
import 'package:flutterproject/pages/home_page.dart';
import 'package:flutterproject/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    final provider = Provider.of<LoginProvider>(context, listen: false);

    final model = LoginModel(
      username: usernameController.text.trim(),
      password: passwordController.text.trim(),
    );

    final success = await provider.login(model);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful")),
      );

      // Navigate to HomePage on success
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(provider.errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.15),
              Center(
                child: Text(
                  "Logo",
                  style: TextStyle(
                    fontSize: size.width * 0.1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.10),
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              // Username Label
              Text(
                "Username",
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              // Username TextField
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              // Password Label
              Text(
                "Password",
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              // Password TextField
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                  hintText: "at least 8 character",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      Text("Remember me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Center(
                child: provider.isLoading
                    ? const CircularProgressIndicator()

                    : ElevatedButton(
                        onPressed: () => login(context),
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(size.width * 0.8, size.height * 0.06),
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // Square corners
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: size.width * 0.045,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
              SizedBox(height: size.height * 0.10),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // import 'package:flutter/material.dart';
// // import 'package:flutterproject/provider/login_provider.dart';
// // import 'package:provider/provider.dart';
// // import '../model/login_model.dart';

// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({Key? key}) : super(key: key);

// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   final TextEditingController _usernameController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     final loginProvider = Provider.of<LoginProvider>(context);

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Login"),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             TextField(
// //               controller: _usernameController,
// //               decoration: const InputDecoration(labelText: "Username"),
// //             ),
// //             const SizedBox(height: 10),
// //             TextField(
// //               controller: _passwordController,
// //               decoration: const InputDecoration(labelText: "Password"),
// //               obscureText: true,
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: loginProvider.isLoading
// //                   ? null
// //                   : () {
// //                       final loginModel = LoginModel(
// //                         username: _usernameController.text.trim(),
// //                         password: _passwordController.text.trim(),
// //                       );
// //                       loginProvider.login(loginModel);
// //                     },
// //               child: loginProvider.isLoading
// //                   ? const CircularProgressIndicator(
// //                       color: Colors.white,
// //                     )
// //                   : const Text("Login"),
// //             ),
// //             if (loginProvider.errorMessage.isNotEmpty)
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 10),
// //                 child: Text(
// //                   loginProvider.errorMessage,
// //                   style: const TextStyle(color: Colors.red),
// //                 ),
// //               ),
// //             if (loginProvider.isLoggedIn)
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 10),
// //                 child: const Text(
// //                   "Login Successful!",
// //                   style: TextStyle(color: Colors.green),
// //                 ),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutterproject/pages/home_page.dart';
// import 'package:flutterproject/provider/login_provider.dart';
// import 'package:provider/provider.dart';
// import '../model/login_model.dart';

// class LoginPage extends StatelessWidget {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   void login(BuildContext context) async {
//     final provider = Provider.of<LoginProvider>(context, listen: false);

//     final model = LoginModel(
//       username: usernameController.text.trim(),
//       password: passwordController.text.trim(),
//     );

//     final success = await provider.login(model);

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Login Successful")),
//       );

//       // Navigate to HomePage on success
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) =>  HomePage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(provider.errorMessage)),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LoginProvider>(context);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 50),
//               TextField(
//                 controller: usernameController,
//                 decoration: const InputDecoration(labelText: "Username"),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: "Password"),
//               ),
//               const SizedBox(height: 20),
//               provider.isLoading
//                   ? const CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: () => login(context),
//                       child: const Text("Login"),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
