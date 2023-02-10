import 'package:flutter/material.dart';

class detail extends StatefulWidget {
  List photos;
  int index;

  detail(this.photos, this.index);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange.shade500,title: Text('details about product')),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Card(
            color: Colors.yellow.shade700,
            elevation: 30,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(widget.photos[widget.index]["image_link"],errorBuilder: (context, error, stackTrace) {
                    return Image.asset("images/loading.gif");
                  },),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "Name: ${widget.photos[widget.index]["name"]}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "product Id: ${widget.photos[widget.index]["id"]}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "price: ${widget.photos[widget.index]["price"]}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "description: ${widget.photos[widget.index]["description"]}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "Brand: ${widget.photos[widget.index]["brand"]}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "category: ${widget.photos[widget.index]["category"]}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "product type: ${widget.photos[widget.index]["product_type"]}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ]),
          ),
        ),
      )),
    );
  }
}
