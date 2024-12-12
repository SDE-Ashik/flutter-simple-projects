// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageChatbot extends StatefulWidget {
//   const ImageChatbot({super.key});

//   @override
//   State<ImageChatbot> createState() => _ImageChatbotState();
// }

// class _ImageChatbotState extends State<ImageChatbot> {
//   File? _selectedImage;
//   String resonseMessage = "";
//   bool isLoading = false;
//   final controller = TextEditingController();

//   final apiUrl =
//       "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyCmtM5-OWr1IwhKd98Bo5AOF5-8xczRgRE";

//   final ImagePicker _picker = ImagePicker();

//   Future<void> pickImage() async {
//     try {
//       final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         setState(() {
//           _selectedImage = File(image.path);
//         });
//       } else {
//         print("No image selected");
//       }
//     } catch (e) {
//       print("Error picking image: $e");
//     }
//   }

//   Future<void> generateResponse() async {
//     if (_selectedImage == null || _selectedImage!.readAsBytes() == null) return;
//     setState(() {
//       isLoading = true;
//       resonseMessage = "";
//       controller.clear();
//     });
//     try {
//       final requestPayload = {
//         "contents": [
//           {
//             "parts": [
//               {"text": controller.text},
//               {
//                 "inlineData": {"mimeType": "image/jpeg", "data": base64.encoder}
//               }
//             ]
//           }
//         ]
//       };

//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(requestPayload),
//       );
//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body);
//         resonseMessage = result['candidates']?[0]?['content']?['parts']?[0]
//                 ?['text'] ??
//             'no text found';
//       }
//       else{
//         responseMess
//       }
//     } catch (e) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Image Chatbot",
//           style: TextStyle(
//             color: Colors.indigo,
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding:const  EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             GestureDetector(
//               onTap:pickImage ,
//               child:_selectedImage==null ? Container(
//                 height: 340,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.blueGrey),
//                 child: const Center(
//                   child: Text(
//                     "Select an Image",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w800,
//                         color: Colors.white),
//                   ),
//                 ),
//               ):Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(30),
//                     child: Image.memory(_selectedImage!.readAsBytes()!,
//                     height: 340,),
//                   ),
//                      const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 80),
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     pickImage();
//                   });
//                 },
//                 style: const ButtonStyle(
//                   backgroundColor: WidgetStatePropertyAll(Colors.indigo),
//                 ),
//                 child: Text(
//                   "Select New Image",
//                   style: const TextStyle(
//                       fontSize: 18,
//                       height: 2,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//                 ],
//               )

//               // button for select image
//             ),
         
//             const SizedBox(height: 20),
//             TextFormField(
//               controller: controller,
//               decoration: InputDecoration(
//                 hintText: "Enter Your Prompt here",
//                 hintStyle: const TextStyle(color: Colors.indigo),
//                 prefixIcon: const Icon(
//                   Icons.pending,
//                   color: Colors.black,
//                 ),
//                 filled: true,
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide.none),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 80),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                     elevation: WidgetStatePropertyAll(0),
//                     backgroundColor: WidgetStatePropertyAll(Colors.indigo)),
//                 child: const Text(
//                   "Genrate Answer",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             isLoading ?const Center(
//               child: CircularProgressIndicator(),
//             ):Text(resonseMessage,textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 18),)
//           ],
//         ),
//       ),
//     );
//   }
// }

// // "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=YOUR_API_KEY"


import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImageChatbot extends StatefulWidget {
  const ImageChatbot({super.key});

  @override
  State<ImageChatbot> createState() => _ImageChatbotState();
}

class _ImageChatbotState extends State<ImageChatbot> {
  File? _selectedImage;
  String responseMessage = "";
  bool isLoading = false;
  final TextEditingController controller = TextEditingController();

  final String apiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyCmtM5-OWr1IwhKd98Bo5AOF5-8xczRgRE";

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> generateResponse() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select an image first.")),
      );
      return;
    }

    setState(() {
      isLoading = true;
      responseMessage = "";
    });

    try {
      final bytes = await _selectedImage!.readAsBytes();
      final base64Image = base64.encode(bytes);

      final requestPayload = {
        "contents": [
          {
            "parts": [
              {"text": controller.text},
              {
                "inlineData": {"mimeType": "image/jpeg", "data": base64Image}
              }
            ]
          }
        ]
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestPayload),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        setState(() {
          responseMessage = result['candidates']?[0]?['content']?['parts']?[0]
                  ?['text'] ??
              'No response received.';
        });
      } else {
        setState(() {
          responseMessage =
              "Error: ${response.statusCode} - ${response.reasonPhrase}";
        });
      }
    } catch (e) {
      setState(() {
        responseMessage = "An error occurred: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Chatbot",
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: _selectedImage == null
                  ? Container(
                      height: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey,
                      ),
                      child: const Center(
                        child: Text(
                          "Select an Image",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            _selectedImage!,
                            height: 340,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: pickImage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                          ),
                          child: const Text(
                            "Select New Image",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter Your Prompt Here",
                hintStyle: const TextStyle(color: Colors.indigo),
                prefixIcon: const Icon(
                  Icons.pending,
                  color: Colors.black,
                ),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateResponse,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(horizontal: 50),
              ),
              child: const Text(
                "Generate Answer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 30),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Text(
                    responseMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
          ],
        ),
      ),
    );
  }
}
