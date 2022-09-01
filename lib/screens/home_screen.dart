import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:xsalonce_mobile/common/sizes.dart';
import 'package:xsalonce_mobile/screens/map_screen.dart';
import 'package:xsalonce_mobile/screens/salon_view_screen.dart';
import 'package:xsalonce_mobile/screens/search_box.dart';

// import 'package:http/http.dart' as http;
import 'package:xsalonce_mobile/screens/search_by_location.dart';
import 'package:xsalonce_mobile/screens/search_screen.dart';
import '../common/colors.dart';

String? category = '';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'xsalonce',
      home: SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var salonData1 = [];
  var nCategory = [];
  var categoryString;
  var categorylen = [];

  void fetchPosts() async {
    // print("working");
    try {
      final response = await get(
        Uri.parse(
            "https://xsalonce-backend.herokuapp.com/api/salon/owner/6285f0418a5f1935e3635473"),
      );

      final jsonData = jsonDecode(response.body);
      // print(jsonData);
      setState(() {
        salonData1 = jsonData;
      });

      // print(salonData1);
      // print(nCategory);
      // print(categorylen);
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [
        //         Color.fromARGB(255, 252, 92, 125),
        //         Color.fromARGB(255, 106, 130, 251),
        //       ],
        //     ),
        //   ),
        // ),
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.face_sharp,
        //     size: 40,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {},
        // ),
        backgroundColor: kColor1,
        title: const Text(
          'XSalonce',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchBox()));
            },
            icon: Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapScreen()));
            },
            icon: Icon(Icons.location_on),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: salonData1.length,
        itemBuilder: (context, index) {
          //  =salonData['category'][index].length;
          int length1 = salonData1[index]["category"].length;
          return SalonCard(salonData1[index], index, length1);
        },
      ),
    );
  }
}

class SalonCard extends StatelessWidget {
  final salon;
  final index;
  int length;

  SalonCard(this.salon, this.index, this.length);

  @override
  Widget build(BuildContext context) {
    // List<int> text = [1, 2, 3];
    // int text=3;
    // print(length);
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      width: kVWidth(context, 1),
      height: kVHeight(context, 0.28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index.isEven
            ? Colors.blue.withOpacity(0.3)
            : Colors.grey.withOpacity(0.3),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            right: -6,
            width: 180.0,
            height: 90.0,
            child: Image.network(
              salon['pro_pic_1'],
              width: kVWidth(context, 0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  salon['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                for (int i = 0; i < length; i++)
                  Text(
                    "${salon['category'][i]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                // Row(
                //   children: [
                //     const Icon(
                //       Icons.star,
                //       size: 16,
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     Text(
                //       salon['rating'],
                //       style: const TextStyle(
                //         color: Color(0xff4E295B),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SalonViewScreen(salon),
                      ),
                    );
                  },
                  color: const Color(0xff4E295B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Goto Salon',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
