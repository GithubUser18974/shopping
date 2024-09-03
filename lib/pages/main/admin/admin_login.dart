import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/pages/main/admin/home_admin.dart';
import 'package:flutter_work/pages/main/login.dart';

import '../../../widgets/support_widget.dart';
import '../widgets/custom_inputfield.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordsController = new TextEditingController();
  late String email, password;
  final _fromkey = GlobalKey<FormState>();
  adminLogin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        print(result.data()['username']);
        print(result.data()['password']);
        if (result.data()['username'] != userNameController.text.trim()) {
          //
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Your UserName Not Correct',
              style: TextStyle(fontSize: 20),
            ),
          ));
        } else if (result.data()['password'] !=
            passwordsController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Your Password not correct',
              style: TextStyle(fontSize: 20),
            ),
          ));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeAdmin()));
        }
      });
    });
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
                    'Admin Login',
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
                  'UserName',
                  style: AppWidget.semiBoldTextStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInputField('userName', userNameController),
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
                        adminLogin();
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
                      'Move to Customer ',
                      style: AppWidget.lightTextFieldStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        'SignIN',
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
