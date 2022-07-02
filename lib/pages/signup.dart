import 'package:flutter/material.dart';
import 'package:last_project/pages/Home.dart';
import 'package:last_project/pages/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool show = true;
  bool show2 = true;
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            shrinkWrap: true,
            children: [
              Image.asset(
                'images/mountainelogo.png',
                width: 150,
                height: 150,
              ),
              Container(
                child: Text(
                  'Create your Account',
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
                // padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(top: 10),
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.blue)),
                child: TextFormField(
                  obscureText: show,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 25,
                        color: Colors.blue,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        child: Icon(
                          show ? Icons.remove_red_eye : Icons.visibility_off,
                          size: 25,
                          color: Colors.blue,
                        ),
                      ),
                      label: Text("Password")),
                ),
              ),
              Container(
                // padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(top: 10),
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.blue)),
                child: TextFormField(
                  obscureText: show2,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 25,
                        color: Colors.blue,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            show2 = !show2;
                          });
                        },
                        child: Icon(
                          show2 ? Icons.remove_red_eye : Icons.visibility_off,
                          size: 25,
                          color: Colors.blue,
                        ),
                      ),
                      label: Text("Confirm Password")),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 350,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    },
                    child: Text(
                      'Sign Up',
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
                      "Already have an account? ",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
