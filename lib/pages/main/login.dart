import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/pages/bottomnav.dart';
import 'package:flutter_work/pages/main/admin/admin_login.dart';
import 'package:flutter_work/pages/main/signup.dart';
import 'package:flutter_work/pages/main/widgets/custom_inputfield.dart';
import 'package:flutter_work/widgets/support_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordsController = new TextEditingController();
  late String email, password;
  final _fromkey = GlobalKey<FormState>();
  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Login Succefully ',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.red,
      ));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Bottomnav()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'No User Found ',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.red,
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'The password is wrong',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          child: Form(
            key: _fromkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/login.jpg'),
                Center(
                  child: Text(
                    'Sign in',
                    style: AppWidget.semiBoldTextStyle(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Please enter the details below to continue',
                  style: AppWidget.lightTextFieldStyle(),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Email',
                  style: AppWidget.semiBoldTextStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInputField('Email', emailController),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Password',
                  style: AppWidget.semiBoldTextStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInputField('Password', passwordsController),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 223, 192),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (_fromkey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                            password = passwordsController.text;
                          });
                          userLogin();
                        }
                      },
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont\'t have an account? ',
                      style: AppWidget.lightTextFieldStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AdminLogin()));
                  },
                  child: Text(
                    'Admin',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
