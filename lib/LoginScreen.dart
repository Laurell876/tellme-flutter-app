import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/questions-pic.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.80,
              height: 80,
              color:  Colors.black.withOpacity(0.4),
              child: Text("TellMe",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  )),
            ),
            SizedBox(height: 80),
            Container(
              width: MediaQuery.of(context).size.width * 0.80,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  ),
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
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  ),
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
                  Navigator.pushNamed(
                      context,
                      '/home'
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New user?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/registration'
                    );
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
