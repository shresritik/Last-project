import 'package:flutter/material.dart';
import 'package:last_project/models/apiModel.dart';
import 'package:last_project/pages/productDetails.dart';
import 'package:http/http.dart' as http;
import 'package:last_project/services/network_helper.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var posts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAPiData();
  }

  getAPiData() async {
    posts = await NetworkHepler().getApiResponse();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 233, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Text(
            "Good Afternoon, User",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(boxShadow: [
                  //background color of box
                  BoxShadow(
                    color: Color.fromARGB(255, 127, 127, 127),

                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 2.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      15.0, // Move to bottom 10 Vertically
                    ),
                  )
                ]),
                child: Image.asset('images/covidbanner.png')),
          ),
          SizedBox(
            height: 25,
          ),
          // posts != null
          //     ? (ListView.builder(
          //         itemCount: posts.length,
          //         itemBuilder: (context, index) {
          //           return Text(posts[index]?.name);
          //         },
          //       ))
          //     : Center(
          //         child: CircularProgressIndicator(),
          //       ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              leading: Image.asset('images/Rectangle.png'),
              title: Text('British Columbia'),
              subtitle: Text(
                'Rs 1080',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductDetail();
                  }));
                },
                child: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
