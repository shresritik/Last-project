import 'package:flutter/material.dart';
import 'package:last_project/pages/productDetails.dart';
import 'package:last_project/services/network_helper.dart';

class ApiPage extends StatefulWidget {
  ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
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
      body: posts != null
          ? (ListView.builder(
              itemCount: posts.length,
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
                );
              },
            ))
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
