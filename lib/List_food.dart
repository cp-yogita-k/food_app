import 'package:flutter/material.dart';
import 'package:navi2_0/detailpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Details {
  var image_link;
  var name;
  var price;
  var id;

  Details(this.image_link, this.name, this.price, this.id);

}

class food extends StatefulWidget {
  const food({Key? key}) : super(key: key);

  @override
  State<food> createState() => _foodState();
}

class _foodState extends State<food> {
  List photos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final http.Response response = await http.get(
      Uri.https('makeup.p.rapidapi.com', '/products.json'),
      headers: {
        'X-RapidAPI-Key': 'd08ffcecdemsh7a46dfee14dfaecp17a74cjsn1953ce33fae0',
        'X-RapidAPI-Host': 'makeup.p.rapidapi.com'
      },
    );
    final data = json.decode(response.body);

    setState(() {
      photos = data;
    });
    // if(response.statusCode == 200)
    //   {
    //     final List result = json.decode(response.body);
    //     return result.map((e) => Details.fromJson(e)).toList();
    //   }
    // else
    //   {
    //     throw Exception('Failed to load data');
    //   }

    // String data = response.body;
    // var productPic = jsonDecode(data)[0]["image_link"];
    // var name = jsonDecode(data)[0]["name"];
    // var price = jsonDecode(data)[0]["price"];
    // var id = jsonDecode(data)[0]["id"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Food details")),
          backgroundColor: Colors.orange.shade500),
      body: Container(
          color: Colors.orange.shade500,
          child: ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  elevation: 30,
                  shadowColor: Colors.black,
                  color: Colors.yellow.shade700,
                  child: ListTile(
                    leading: Image.network(photos[index]["image_link"],width: 70,height: 300,
                    fit: BoxFit.fill),
                    title: Text("${photos[index]["name"]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                    subtitle: Container(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Text("price :${photos[index]["price"]}",style: TextStyle(fontSize: 20)),
                        Text("id number:${photos[index]["id"]}",style: TextStyle(fontSize: 20),)
                      ]),
                      height: 120,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return detail();
                                  },
                                ));
                              },
                              icon: Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 58,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                size: 60,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
