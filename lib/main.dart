import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tellme_flutter_app/HomeScreen.dart';
import 'dart:convert' show json, base64, ascii;
import 'dart:convert';
import './AuthUser.dart';
import './AuthResponse.dart';
import 'Models/Question.dart';
import './LoginScreen.dart';
import './RegistrationScreen.dart';



const SERVER_IP = 'http://10.0.2.2:3000/api'; // accesses localhost on device
final storage = FlutterSecureStorage();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>LoginScreen(),
        '/registration':(context)=>RegistrationScreen(),
        '/home':(context)=>HomeScreen(),
      }
    );
  }
}
//
// class LoginPage extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   void displayDialog(context, title, text) => showDialog(
//     context: context,
//     builder: (context) =>
//         AlertDialog(
//             title: Text(title),
//             content: Text(text)
//         ),
//   );
//
//   Future<String> attemptLogIn(String email, String password) async {
//     var res = await http.post(
//       '$SERVER_IP/auth/login',
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'email': email,
//         'password': password
//       }),
//     );
//     if (res.statusCode == 200) {
//       final Map parsed = json.decode(res.body);
//       AuthResponse authResponse = AuthResponse.fromJson(parsed);
//       return authResponse.accessToken;
//     }
//     return null;
//   }
//
//   Future<int> attemptSignUp(String username, String password) async {
//     var res = await http.post(
//         '$SERVER_IP/signup',
//         body: {
//           "username": username,
//           "password": password
//         }
//     );
//     return res.statusCode;
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Log In"),),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                     labelText: 'Email'
//                 ),
//               ),
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     labelText: 'Password'
//                 ),
//               ),
//               FlatButton(
//                   onPressed: () async {
//                     var email = _emailController.text;
//                     print(email);
//                     var password = _passwordController.text;
//                     var jwt = await attemptLogIn(email, password);
//                     if(jwt != null) {
//                       storage.write(key: "jwt", value: jwt);
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => HomePage.fromBase64(jwt)
//                           )
//                       );
//                     } else {
//                       displayDialog(context, "An Error Occurred", "No account was found matching that username and password");
//                     }
//                   },
//                   child: Text("Log In")
//               ),
//               FlatButton(
//                   onPressed: () async {
//                     var username = _emailController.text;
//                     var password = _passwordController.text;
//
//                     if(username.length < 4)
//                       displayDialog(context, "Invalid Username", "The username should be at least 4 characters long");
//                     else if(password.length < 4)
//                       displayDialog(context, "Invalid Password", "The password should be at least 4 characters long");
//                     else{
//                       var res = await attemptSignUp(username, password);
//                       if(res == 201)
//                         displayDialog(context, "Success", "The user was created. Log in now.");
//                       else if(res == 409)
//                         displayDialog(context, "That username is already registered", "Please try to sign up using another username or log in if you already have an account.");
//                       else {
//                         displayDialog(context, "Error", "An unknown error occurred.");
//                       }
//                     }
//                   },
//                   child: Text("Sign Up")
//               )
//             ],
//           ),
//         )
//     );
//   }
// }
//
//
// class HomePage extends StatelessWidget {
//   HomePage(this.jwt, this.payload);
//
//   factory HomePage.fromBase64(String jwt) =>
//       HomePage(
//           jwt,
//           json.decode(
//               ascii.decode(
//                   base64.decode(base64.normalize(jwt.split(".")[1]))
//               )
//           )
//       );
//
//   Future<dynamic> get questions async {
//     var res = await http.get('$SERVER_IP/questions',
//       headers: {HttpHeaders.authorizationHeader: 'bearer $jwt'},
//     );
//     print(res.body);
//     if (res.statusCode == 200) {
//       var questions = jsonDecode(res.body);
//       List<Question> questionList = (questions as List)
//           .map((data) => new Question.fromJson(data))
//           .toList();
//       return questionList;
//     }
//
//
//     return null;
//   }
//
//   final String jwt;
//   final Map<String, dynamic> payload;
//
//   @override
//   Widget build(BuildContext context) =>
//       Scaffold(
//         appBar: AppBar(title: Text("Secret Data Screen")),
//         body: Center(
//           child: FutureBuilder(
//               future: questions,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                       padding: const EdgeInsets.all(8),
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           child: Center(child: Text(
//                               'Entry ${snapshot.data[index].description}')),
//                         );
//                       }
//                   );
//                 } else {
//                  return  CircularProgressIndicator();
//                 }
//               }
//           ),
//         ),
//       );
// }
//
//
// class MyApp extends StatelessWidget {
//   Future<String> get jwtOrEmpty async {
//     var jwt = await storage.read(key: "jwt");
//     if(jwt == null) return "";
//     return jwt;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Authentication Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FutureBuilder(
//           future: jwtOrEmpty,
//           builder: (context, snapshot) {
//             if(!snapshot.hasData) return CircularProgressIndicator();
//             if(snapshot.data != "") {
//               var str = snapshot.data;
//               var jwt = str.split(".");
//
//               if(jwt.length !=3) {
//                 return LoginPage();
//               } else {
//                 var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
//                 if(DateTime.fromMillisecondsSinceEpoch(payload["exp"]*1000).isAfter(DateTime.now())) {
//                   return HomePage(str, payload);
//                 } else {
//                   return LoginPage();
//                 }
//               }
//             } else {
//               return LoginPage();
//             }
//           }
//       ),
//     );
//   }
// }