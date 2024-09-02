import 'package:flutter/material.dart';
import 'package:flutter_work/utility/colours.dart';
import 'package:flutter_work/widgets/support_widget.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colours.detailPageBGColor,
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back_ios_outlined)),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/headphone2.png',
                      height: 400,
                    ),
                  ),
                ],
              ),

              /// Style Container
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,

                  /// > Product Name >> price
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Apple Watch",
                              style: AppWidget.boldTextFieldStyle(),
                            ),
                            Text(
                              "\$200",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colours.orangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      ///Detailes header
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Details',
                          style: AppWidget.semiBoldTextStyle(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Details Content
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 8,
                          'oth 5.3 chipset, enhancing connect',
                          style: AppWidget.productDetailsTextStyle(),
                        ),
                      ),
                      ///////BUY ME BUTTON
                      Container(
                        margin: EdgeInsets.only(
                          left: 40,
                          right: 40,
                          top: 15,
                        ),
                        decoration: BoxDecoration(
                            color: Colours.orangeColor,
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        height: 60,
                        child: Center(
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// ////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
