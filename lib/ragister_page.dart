import 'package:flutter/material.dart';
import 'package:navi2_0/List_food.dart';
import 'package:navi2_0/login_page.dart';

class ragister extends StatefulWidget {
  const ragister({Key? key}) : super(key: key);

  @override
  State<ragister> createState() => _ragisterState();
}

class _ragisterState extends State<ragister> {
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double stbar = MediaQuery.of(context).padding.top;
    double bpnavi = MediaQuery.of(context).padding.bottom;
    double height = theight - stbar - bpnavi;
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Sign In page")),
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
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      label: Text(" Name", style: TextStyle(fontSize: 25)),
                      hintText: "Enter the name",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                      label: Text("User name", style: TextStyle(fontSize: 25)),
                      hintText: "Enter the username",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                      label: Text("Password", style: TextStyle(fontSize: 25)),
                      hintText: "Enter the Password",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                      label:
                          Text("PhoneNumber", style: TextStyle(fontSize: 25)),
                      hintText: "Enter the phonenumber",
                      border: OutlineInputBorder()),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return food();
                    },
                  ));
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
                  width: height * 0.2,
                  height: height / 15,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
