import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String iD) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(iD)
        .set(userInfoMap);
  }

  Future addProduct(
      Map<String, dynamic> userInfoMap, String categoryName) async {
    return await FirebaseFirestore.instance
        .collection(categoryName)
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getProducts(String category) async {
    return await FirebaseFirestore.instance.collection("Watch").snapshots();
  }
}
