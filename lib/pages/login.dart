import 'package:flutter/material.dart';
import 'package:last_project/pages/Home.dart';
import 'package:last_project/pages/api_page.dart';
import 'package:last_project/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/mountainelogo.png',
              width: 150,
              height: 150,
            ),
            Container(
              child: Text(
                'Login to your Account',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 10),
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.blue)),
              child: TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.blue,
                    ),
                    label: Text("Email")),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 10),
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.blue)),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      size: 25,
                      color: Colors.blue,
                    ),
                    label: Text("Password")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: check,
                          onChanged: (bool? newvalue) {
                            setState(() {
                              check = newvalue;
                            });
                          }),
                      Text("Remeber Me"),
                    ],
                  ),
                  Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ApiPage();
                    }));
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont'have an account? ",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return Signup();
                      })));
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
