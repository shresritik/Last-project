import 'package:carousel_slider/carousel_slider.dart';
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
  final List<String> imageList = [
    'https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1475924156734-496f6cac6ec1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1469521669194-babb45599def?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80'
  ];
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
          SizedBox(
            height: 10,
          ),
          Center(
            child: CarouselSlider(
              items: imageList
                  .map((item) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              item,
                              width: 300,
                              height: 200,
                            )
                          ],
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Container(
          //       decoration: BoxDecoration(boxShadow: [
          //         //background color of box
          //         BoxShadow(
          //           color: Color.fromARGB(255, 127, 127, 127),

          //           blurRadius: 10.0, // soften the shadow
          //           spreadRadius: 2.0, //extend the shadow
          //           offset: Offset(
          //             0.0, // Move to right 10  horizontally
          //             15.0, // Move to bottom 10 Vertically
          //           ),
          //         )
          //       ]),
          //       child: Image.asset('images/covidbanner.png')),
          // ),
          SizedBox(
            height: 25,
          ),
          posts != null
              ? (ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: posts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(10)),
                        leading: Image.network(
                          'http://mark.bslmeiyu.com/uploads/${(posts[index]?.img).toString()}',
                          width: 50,
                          height: 50,
                        ),
                        title: Text(posts[index]?.name),
                        subtitle: Text(
                          'Rs. ' + (posts[index]?.price).toString(),
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetail(
                                index: posts[index],
                              );
                            }));
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    );
                  },
                ))
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
