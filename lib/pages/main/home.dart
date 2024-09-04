import 'package:flutter/material.dart';
import 'package:flutter_work/pages/main/widgets/category_tile.dart';
import 'package:flutter_work/services/shared_prefrence.dart';
import 'package:flutter_work/utility/colours.dart';
import 'package:flutter_work/widgets/support_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    "assets/images/headphone_icon.png",
    "assets/images/laptop.png",
    "assets/images/watch.png",
    "assets/images/TV.png",
  ];
  List categoryNames = ['Watch', 'Laptops', 'TV', 'Headphone'];
  String? userName, userImage;
  getSharedPrefrences() async {
    userName = await SharedPreferenceHelper().GetUserName();
    userImage = await SharedPreferenceHelper().GetUserImage();
    setState(() {});
  }

  ontheLoada() async {
    await getSharedPrefrences();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    ontheLoada();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colours.homePageBGColor,
        body: userName == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  userName!,
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
                              child: Image.network(
                                userImage!,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            )
                          ]),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Products",
                            hintStyle: AppWidget.lightTextFieldStyle(),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        //Categories -- See ALl section
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: AppWidget.semiBoldTextStyle(),
                          ),
                          Text(
                            'See All',
                            style: AppWidget.orangeSeeALlTextStyle(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            padding: EdgeInsets.all(20),
                            height: 140,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colours.orangeColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 140,
                              child: ListView.builder(
                                  itemCount: categories.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CategoryTile(categories[index],
                                        categoryNames[index]);
                                  }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        //Categories -- See ALl section
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'All Products',
                            style: AppWidget.semiBoldTextStyle(),
                          ),
                          Text(
                            'See All',
                            style: AppWidget.orangeSeeALlTextStyle(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 240,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/headphone2.png',
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    'Headphone',
                                    style: AppWidget.semiBoldTextStyle(),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$100',
                                        style: TextStyle(
                                          color: Colours.orangeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colours.orangeColor,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        padding: EdgeInsets.all(5),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ///////////////////////////////////////////////////////////////////////
                            GestureDetector(
                              // onTap: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => ProductDetail()));
                              // },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                margin: EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/headphone2.png',
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      'Headphone',
                                      style: AppWidget.semiBoldTextStyle(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$100',
                                          style: TextStyle(
                                            color: Colours.orangeColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colours.orangeColor,
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          padding: EdgeInsets.all(5),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ///////////////////////////////////////////////////////////////
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/headphone2.png',
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    'Headphone',
                                    style: AppWidget.semiBoldTextStyle(),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$100',
                                        style: TextStyle(
                                          color: Colours.orangeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colours.orangeColor,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        padding: EdgeInsets.all(5),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
