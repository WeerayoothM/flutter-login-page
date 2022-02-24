import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  String? text = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Uesrname")),
      body: Center(
          child: ListView(
        children: [
          Text(
            text!,
            style: TextStyle(fontSize: 25),
          )
        ],
      )),
    );
  }

  getUsername() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final username = sharedPreferences.getString('uesrname');
    setState(() {
      text = username;
    });
  }
}
