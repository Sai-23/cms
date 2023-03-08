import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var _isHiddenPassword = true; // For making password visible and invisible
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: GestureDetector(
        //To hide the keyboard when tapped anywhere on the login screen
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.login_rounded,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //                    TODO:GREET_USER

                  Text(
                    'Welcome To SmartByte!',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Please Log-In To Continue',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  //                     TODO:EMAIL FIELD
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              border: InputBorder.none,
                              hintText: 'Email'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //                   TODO:PASSWORD FIELD
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: TextField(
                          obscureText: _isHiddenPassword,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.key),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isHiddenPassword = !_isHiddenPassword;
                                    });
                                  },
                                  child: const Icon(Icons.visibility)),
                              border: InputBorder.none,
                              hintText: 'Password'),
                        ),
                      ),
                    ),
                  ),
                  //                  TODO:SIGN IN BUTTON
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, '/mainPage');
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
