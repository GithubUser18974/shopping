import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/services/database.dart';
import 'package:flutter_work/widgets/support_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker picker = ImagePicker();
  File? selectedImage;
  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  /////////////
  /////////////
  /////////////
  Future GetImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() async {
    if (selectedImage != null && !nameController.text.isEmpty) {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorage =
          FirebaseStorage.instance.ref().child('blogImage').child(addId);
      final UploadTask task = firebaseStorage.putFile(selectedImage!);
      var downloadUrl = await (await task).ref.getDownloadURL();
      Map<String, dynamic> addProduct = {
        "name": nameController.text,
        "Image": downloadUrl,
        "Description": descriptionController.text,
        "Price": priceController.text,
      };
      //
      await DataBaseMethods()
          .addProduct(addProduct, selectedItemCategory!)
          .then((selectedItemCategory) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Product added Successfully',
            style: TextStyle(fontSize: 20),
          ),
        ));
        selectedImage = null;
        nameController.text = "";
      });
    }
  }

  String selectedItemCategory = "Watch";
  final List<String> categoryItems = ['Watch', 'Laptops', 'TV', 'Headphone'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
          title: Text(
            "Add Product",
            style: AppWidget.boldTextFieldStyle(),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upload the product Image',
                  style: AppWidget.lightTextFieldStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                selectedImage == null
                    ? GestureDetector(
                        onTap: () {
                          GetImage();
                        },
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 80,
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Product Name',
                  style: AppWidget.lightTextFieldStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Product Category',
                  style: AppWidget.lightTextFieldStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: selectedItemCategory,
                        items: categoryItems.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedItemCategory = value!;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Product Price',
                  style: AppWidget.lightTextFieldStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Product Description',
                  style: AppWidget.lightTextFieldStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    maxLines: 6,
                    controller: descriptionController,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        uploadItem();
                      },
                      child: Text(
                        'Add Product',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
