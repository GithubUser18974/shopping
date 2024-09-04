import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/pages/main/product_detail.dart';
import 'package:flutter_work/services/database.dart';
import 'package:flutter_work/widgets/support_widget.dart';

import '../../utility/colours.dart';

class CategoryProduct extends StatefulWidget {
  late String category;
  CategoryProduct(this.category);
  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  Stream? categoryStream;
  getOnTheLoad() async {
    categoryStream = await DataBaseMethods().getProducts(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allProudcts() {
    return StreamBuilder(
        stream: categoryStream,
        builder: (context, AsyncSnapshot snapshot) {
          print(
              "****************************************************************************");
          print(snapshot.data);
          print(
              "****************************************************************************");
          return snapshot.hasData
              ? GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 10),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image.network(
                            ds["Image"],
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            ds["name"],
                            style: AppWidget.semiBoldTextStyle(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$' + ds["Price"],
                                style: TextStyle(
                                  color: Colours.orangeColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetail(
                                              ds["name"],
                                              ds["Price"],
                                              ds["Image"],
                                              ds["Description"])));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colours.orangeColor,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.homePageBGColor,
      appBar: AppBar(
        backgroundColor: Colours.homePageBGColor,
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
        ),
        child: Column(
          children: [Expanded(child: allProudcts())],
        ),
      ),
    );
  }
}
