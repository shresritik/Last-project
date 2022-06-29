import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Detail",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 212, 224),
        leading: GestureDetector(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Color.fromARGB(255, 255, 212, 224),
            padding: EdgeInsets.all(20),
            // width: double.infinity,
            child: Center(
              child: Image.asset(
                'images/flower.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.left,
                  "blue Roses Bunch",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  textAlign: TextAlign.left,
                  "Rs. 1000",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 217, 0),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 217, 0),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 217, 0),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 217, 0),
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 193, 193, 193),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '4.2',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "A rose for a rose; Perfect gift for your beloved. Any celebration, flowers are the necessary answer. A rose for a rose; Perfect gift for your beloved. Any celebration, flowers are the necessary answer",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Buy Now', style: TextStyle(fontSize: 16)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.blue)))),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextButton(
                          child: Text("Add to cart".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15)),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: Colors.blue)))),
                          onPressed: () => null),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
