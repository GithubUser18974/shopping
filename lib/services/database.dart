import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String iD) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(iD)
        .set(userInfoMap);
  }
}
