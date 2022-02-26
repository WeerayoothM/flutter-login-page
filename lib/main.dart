import 'package:flutter/material.dart';
import 'package:flutterloginpage/viewpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  bool _eyeOn = false;
  String result = "--- Result ---";
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                    labelText: "Username", hintText: "Username"),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordController,
                obscureText: _eyeOn,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  suffixIcon: IconButton(
                      hoverColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          _eyeOn = !_eyeOn;
                        });
                      },
                      icon: Icon(_eyeOn
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (usernameController.text == 'admin') {
                      print('ADMIN USER');
                      setState(() {
                        result = 'User: admin';
                        setUsername(usernameController.text);
                        setStatus('Success');
                      });
                    } else {
                      print('OTHER USER');
                      setState(() {
                        result = 'Login fail';
                        setUsername(usernameController.text);
                        setStatus('fail');
                      });
                    }
                  },
                  child: Text("Login")),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewPage()));
                  },
                  child: Text("Show Username")),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  result,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setUsername(String textUsername) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('username', textUsername);
  }

  void setStatus(String s) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('status', s);
  }
}
