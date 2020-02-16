import 'package:flutter/material.dart';
import 'package:recycle_app/main.dart';
import 'package:recycle_app/src/home_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/leaf_back.png',
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: <Widget>[
            Form(
              child: Expanded(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 169,
                    ),
                    Center(
                      child: Text(
                        'Login',
                        style:
                            TextStyle(fontSize: 50, color: Colors.lightGreen),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Form(
                          child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Rrovide an eamil';
                                }
                              },
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.green),
                                  labelText: "Email",
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: TextFormField(
                              validator: (input) {
                                if (input.length > 6) {
                                  return 'Password should 6 character at least';
                                }
                              },
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.green),
                                  labelText: "Email",
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: RaisedButton(
                              padding:
                                  EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
                              color: Colors.lightGreen,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20),
                          ),
                          GestureDetector(
                            child: Text(
                              'Create an Account',
                              style: TextStyle(fontSize: 20.0),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()),
                              );
                            },
                          )
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
