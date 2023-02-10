import 'package:flutter/material.dart';
import 'package:navi2_0/detailpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Details {
  String? image_link;
  String name;
  int price;
  int id;

  Details(this.image_link, this.name, this.price, this.id);
}

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
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
    if (data == null) {
      const Image(image: AssetImage("images/loading.gif"));
    }
    setState(() {
      photos = data;
    });
  }

  Future<void> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('makeup.p.rapidapi.com/products.json/$id'),
      headers: <String, String>{
        'X-RapidAPI-Key': 'd08ffcecdemsh7a46dfee14dfaecp17a74cjsn1953ce33fae0',
        'X-RapidAPI-Host': 'makeup.p.rapidapi.com'
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("product details")),
          backgroundColor: Colors.orange.shade500),
      body: RefreshIndicator(onRefresh:getData,
        child: Container(
            color: Colors.orange.shade500,
            child: ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return Dismissible(key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        photos.removeAt(index);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        elevation: 30,
                        shadowColor: Colors.black,
                        color: Colors.yellow.shade700,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return detail(photos, index);
                              },
                            ));
                          },
                          leading: Image.network(photos[index]["image_link"],
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset("images/loading.gif");
                              },
                              width: 70, height: 300, fit: BoxFit.fill),
                          title: Text("${photos[index]["name"]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  overflow: TextOverflow.ellipsis)),
                          subtitle: Container(
                            height: 70,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("price :${photos[index]["price"]}",
                                      style: const TextStyle(fontSize: 20)),
                                  Text(
                                    "id number:${photos[index]["id"]}",
                                    style: const TextStyle(fontSize: 20),
                                  )
                                ]),
                          ),
                          // trailing: Padding(
                          //   padding: const EdgeInsets.all(10.0),
                          //   child: IconButton(
                          //       onPressed: () {},
                          //       icon: const Icon(
                          //         Icons.delete,
                          //         size: 60,
                          //       )),
                          // ),
                        ),
                      ),
                    ));
              },
            )),
      ),
    );
  }
}
