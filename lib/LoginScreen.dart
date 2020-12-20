import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/questions-pic.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("TellMe",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                )),
            SizedBox(height: 80),
            Container(
              width: MediaQuery.of(context).size.width * 0.80,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.4),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.80,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.4),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width * 0.80,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.black,
              splashColor: Colors.black26,
              onPressed: () {
                print('done');
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

          ],
        ),
      ),
    );
  }
}
