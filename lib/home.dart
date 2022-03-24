import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operation/change_notifier.dart';
import 'package:crud_operation/todomodel.dart';
import 'package:crud_operation/viewpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _text = TextEditingController();
    final _name = TextEditingController();
    final _surname = TextEditingController();
    final _userid = TextEditingController();
    final _gmail = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Container(
                  height: 170,
                  child: Image.network(
                      'https://media-exp1.licdn.com/dms/image/C560BAQEsg51qjanOIw/company-logo_200_200/0/1645424779393?e=1654732800&v=beta&t=ueTWheRc-vODevIk1BiKzax12Og_tvCxhEtZQbLB8g0'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                        labelText: 'Name', border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  child: TextField(
                    controller: _surname,
                    decoration: InputDecoration(
                        labelText: 'Surname', border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  child: TextField(
                    controller: _userid,
                    decoration: InputDecoration(
                        labelText: 'User_id', border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  child: TextField(
                    controller: _gmail,
                    decoration: InputDecoration(
                        labelText: 'Gmail', border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Successfully sent',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ));
                      Signupmodel model = Signupmodel(
                          name: _name.text,
                          surname: _surname.text,
                          userid: _userid.text,
                          gmail: _gmail.text);
                      context.read<Apicall>().createuser(data: model);
                      _name.clear();
                      _surname.clear();
                      _userid.clear();
                      _gmail.clear();
                    },
                    child: Text('Submit')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Viewpage()),
                    );
                  },
                  child: Text('View'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
