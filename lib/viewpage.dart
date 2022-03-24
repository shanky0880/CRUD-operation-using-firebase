import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operation/todomodel.dart';
import 'package:flutter/material.dart';

class Viewpage extends StatelessWidget {
  const Viewpage({Key? key}) : super(key: key);
  Future<List<Signupmodel>> readUser() async {
    var x = await FirebaseFirestore.instance.collection('user').get();
    return x.docs.map((e) => Signupmodel.fromJson(e.data())).toList(); //DOCUMENT MAP TO TODOMODEL

    // return Signupmodel.fromJson(x.data()!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<List<Signupmodel>>(     
          future: readUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text('Please wait'));
            } else {
              final firedata = snapshot.data!;
              return Center(
                child: ListView.builder(
                    itemCount: firedata.length,
                    itemBuilder: (context, index) {
                      var ddd = firedata[index]; //DATA IS STORE
                      return ListTile(
                        title: Column(
                          children: [
                            Container(
                              child: Text(ddd.name),
                            ),
                            Container(
                              child: Text(ddd.surname),
                            ),
                            Container(
                              child: Text(ddd.gmail),
                            ),
                            Container(
                              child: Text(ddd.userid),
                            ),
                          ],
                        ),

                        // title: Text(ddd.name),
                      );
                    }),
              );
            }
          },
        ));
  }
}
