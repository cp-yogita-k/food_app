import 'package:flutter/material.dart';
import 'package:navi2_0/List_food.dart';
import 'package:navi2_0/ragister_page.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Login page")),
          backgroundColor: Colors.orange.shade700),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/log.jpg"), fit: BoxFit.fill)),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 240,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      label: Text("User name", style: TextStyle(fontSize: 25)),
                      hintText: "Enter the username",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      label: Text("Password", style: TextStyle(fontSize: 25)),
                      hintText: "Enter the Password",
                      border: OutlineInputBorder()),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return food();
                    },));
                  },
                    child: Container(
                      child: Center(
                          child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.orange.shade700,
                          boxShadow: [BoxShadow(blurRadius: 5)],
                          borderRadius: BorderRadius.circular(10)),
                      width: 150,
                      height: 50,
                    ),
                  ),
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ragister();
                    },));
                  },
                    child: Container(
                      child: Center(
                          child: Text(
                        "sign in",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius: 5)],
                          color: Colors.orange.shade700,
                          borderRadius: BorderRadius.circular(10)),
                      width: 150,
                      height: 50,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
