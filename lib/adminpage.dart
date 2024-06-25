import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:losha_puppy_rescue_app/SignUp.dart';
import 'package:losha_puppy_rescue_app/updateUser.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        title: Text("Admin Page"),
      ),
      body: new FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error in loading " + snapshot.error.toString());
            }
            return snapshot.hasData
                ? new ItemList(list: snapshot.data ?? [])
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUp()));
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.isEmpty ? 0 : list.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateUser(
                              ID: list[i]['ID'] ?? '',
                              fname: list[i]['FirstName'] ?? '',
                              lname: list[i]['LastName'] ?? '',
                              phoneNumber: list[i]['PhoneNumber'] ?? '',
                              address: list[i]['Address'] ?? '',
                              volExp: list[i]['Volunteer_Exp'] ?? '',
                              email: list[i]['Email'] ?? '',
                            )));
              },
              leading: CircleAvatar(
                child: Text(
                  list[i]['FirstName'].toString().substring(0, 1).toUpperCase(),
                ),
              ),
              title: new Text(list[i]['FirstName'] + ' ' + list[i]['LastName']),
              subtitle: new Text(
                list[i]['Email'] +
                    '\n' +
                    list[i]['PhoneNumber'] +
                    '\n' +
                    'Volunteer Exp :' +
                    ' ' +
                    list[i]['Volunteer_exp'],
              ),
            ),
          );
        });
  }
}

Future<List> getData() async {
  var url = Uri.parse("http://192.168.1.101/Flutter_demoApp/getAllData.php");
  final response = await http.get(url);
  var dataReceived = json.decode(response.body);
  return dataReceived;
}
