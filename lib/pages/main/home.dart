import 'package:flutter/material.dart';
import 'package:flutter_work/utility/colours.dart';
import 'package:flutter_work/widgets/support_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colours.homePageBGColor,
        body: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  children: [
                    Text(
                      'Hey, Araby',
                      style: AppWidget.boldTextFieldStyle(),
                    ),
                    Text(
                      'Good Morning',
                      style: AppWidget.lightTextFieldStyle(),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/boy.jpg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
