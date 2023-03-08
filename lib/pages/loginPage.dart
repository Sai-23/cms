import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  Image.asset('images/login_logo.png',height: 200,),
                  const SizedBox(
                    height: 25,
                  ),
                  //                     TODO:EMAIL FIELD
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                         Text(
                          'LOGIN PAGE ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,fontSize: 30,fontStyle: FontStyle.italic
                          ),
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                          height: 15,
                        ),
                                      //  TODO:PASSWORD FIELD
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                                        // TODO: SIGN-IN BUTTON
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(context, '/mainPage');
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50,top: 20,bottom: 40),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.green[700],
                                  borderRadius: BorderRadius.circular(12)),
                              child:  Center(
                                child: Text(
                                  'Sign In',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
