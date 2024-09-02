import 'package:flutter/material.dart';
import 'package:flutter_work/pages/main/login.dart';
import 'package:flutter_work/pages/main/widgets/custom_inputfield.dart';

import '../../widgets/support_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
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
                'Name',
                style: AppWidget.semiBoldTextStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              CustomInputField('Enter your name'),
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
              CustomInputField('Email'),
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
              CustomInputField('Password'),
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
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
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
                    'Already have an account? ',
                    style: AppWidget.lightTextFieldStyle(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
