import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operation/todomodel.dart';
import 'package:flutter/cupertino.dart';

class Apicall extends ChangeNotifier {
  Future<void> createuser({required Signupmodel data}) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc()
        .set(data.toJson());
  }
}
