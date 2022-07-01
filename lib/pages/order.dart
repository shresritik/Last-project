import 'package:flutter/material.dart';
import 'package:last_project/pages/Home.dart';
import 'package:last_project/pages/productDetails.dart';
import 'package:last_project/services/network_helper.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Orders',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            }));
          }),
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.blue,
          ),
        ),
        elevation: 0,
      ),
      body: posts != null
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
                    trailing: SizedBox(
                      height: 20,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Icon(
                            Icons.shopping_cart_sharp,
                            color: Colors.blue,
                          ),
                          Text(' Stock: ' +
                              posts[index].stars.toString() +
                              '/' +
                              posts[index].people.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
