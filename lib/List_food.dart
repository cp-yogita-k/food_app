import 'package:flutter/material.dart';
import 'package:navi2_0/detailpage.dart';
import 'package:http/http.dart';

class food extends StatefulWidget {
  const food({Key? key}) : super(key: key);

  @override
  State<food> createState() => _foodState();
}

class _foodState extends State<food> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
     Response response= await get(
      Uri.https("spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
          "/food/ingredient"),
      headers: {
        'X-RapidAPI-Key': '6991e41207mshaaf1e8dd61f03fdp17fbe9jsn3c96953146c7',
        'X-RapidAPI-Host': 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
      },
    );
    print(response.body);
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
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.yellow.shade700,
                child: ListTile(
                  title: Text(""),
                  subtitle: Container(
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
        ),
      ),
    );
  }
}
