import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);  

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var _isHiddenPassword = true; // For making password visible and invisible
  final loginFormKey = GlobalKey<FormState>();
  var loginEmail = TextEditingController();
  var loginPassword = TextEditingController();
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


                  //                  TODO:LOGIN CONTAINER

                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 2,
                          blurRadius: 15,
                      )],
                      color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: loginFormKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                           Text(
                            'LOGIN PAGE ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                                fontSize: 30,
                                fontStyle: FontStyle.italic
                            ),
                          ),
                          const SizedBox(height: 40),


                                             // TODO:EMAIL FIELD

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: TextFormField(
                                controller: loginEmail,
                                decoration:  InputDecoration(

                                    prefixIcon: const Icon(Icons.mail),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    labelText: 'Email'),
                                validator: (value) {
                                  if ((value == null || value.isEmpty)) {
                                    return '*Required Field';
                                  }
                                  else if(!EmailValidator.validate(value)){
                                    return 'Please Enter Valid Email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),


                                        //  TODO:PASSWORD FIELD


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: TextFormField(
                                controller: loginPassword,
                                obscureText: _isHiddenPassword,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.key),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isHiddenPassword = !_isHiddenPassword;
                                          });
                                        },
                                        child: const Icon(Icons.visibility),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    labelText: 'Password'),
                                    validator:(value){
                                  if(value==null||value.isEmpty){
                                    return "*Required Field";
                                  }
                                  else{

                                  }
                                    } ,
                              ),
                            ),
                          ),

                                          // TODO: SIGN-IN BUTTON

                          GestureDetector(
                            onTap: () {
                              final isValidForm = loginFormKey.currentState!.validate();
                              if(isValidForm){
                                if(loginEmail.text=="aaa@gmail.com"&&loginPassword.text=="aaa123"){
                                  Navigator.pushNamed(context, '/mainPage');
                                }
                                else{
                                  QuickAlert.show(
                                    context: context,
                                    animType: QuickAlertAnimType.slideInUp,
                                    type: QuickAlertType.error,
                                    title: 'INVALID CREDENTIALS',
                                    text: 'Enter Correct Credentials',
                                  );
                                }

                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50,right: 50,top: 20,bottom: 40),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: Colors.green[700],
                                    borderRadius: BorderRadius.circular(20)),
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
