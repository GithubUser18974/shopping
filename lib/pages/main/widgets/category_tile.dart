import 'package:flutter/material.dart';
import 'package:flutter_work/pages/main/category_product.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile(this.imgPath, this.categoryName);
  String imgPath;
  String categoryName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryProduct(categoryName)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(20),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imgPath,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
