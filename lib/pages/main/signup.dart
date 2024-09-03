import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/pages/bottomnav.dart';
import 'package:flutter_work/pages/main/login.dart';
import 'package:flutter_work/pages/main/widgets/custom_inputfield.dart';
import 'package:flutter_work/services/database.dart';
import 'package:flutter_work/services/shared_prefrence.dart';
import 'package:random_string/random_string.dart';

import '../../widgets/support_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late String name, email, passwords;
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  registrationMethod() async {
    if (!passwords.isEmpty && !name.isEmpty && !passwords.isEmpty) {
      try {
        print('Before');
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email!, password: passwords!);
        print('After');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Registered Successfully',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
        String id = randomAlphaNumeric(20);
        await SharedPreferenceHelper().saveUserEmail(emailController.text);
        await SharedPreferenceHelper().saveUserId(id);
        await SharedPreferenceHelper().saveUserImage(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cat_November_2010-1a.jpg/800px-Cat_November_2010-1a.jpg");
        await SharedPreferenceHelper().saveUserName(nameController.text);
        Map<String, dynamic> userInfoMap = {
          "Name": nameController.text,
          "Email": emailController.text,
          "iD": id,
          "Image":
              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cat_November_2010-1a.jpg/800px-Cat_November_2010-1a.jpg"
        };
        await DataBaseMethods().addUserDetails(userInfoMap, id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Bottomnav()));
      } on FirebaseException catch (e) {
        print(e.message);
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Password is too weak',
              style: TextStyle(fontSize: 20),
            ),
          ));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Account Already exist',
              style: TextStyle(fontSize: 20),
            ),
          ));
        }
        print(e.message);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/login.jpg'),
                Center(
                  child: Text(
                    'Sign Up',
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
                CustomInputField('Enter your name', nameController),
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
                CustomInputField('Password', passwordController),
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
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            name = nameController.text;
                            email = emailController.text;
                            passwords = passwordController.text;
                          });
                        }
                        print('Clicked Sign Up');
                        registrationMethod();
                      },
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
                        print(nameController.text);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
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
      ),
    ));
  }
}
