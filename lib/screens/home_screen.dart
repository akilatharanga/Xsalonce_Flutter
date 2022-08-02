import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:xsalonce_mobile/screens/salon_view_screen.dart';
import 'package:http/http.dart' as http;

const salonData = [
  {
    'salonName': 'Salon GoodLook',
    'rating': '4.8',
    'rateAmount': '10',
    'category': 'Hair Cut, Facial',
    'imgUrl':
        'https://images.unsplash.com/photo-1616394584738-fc6e612e71b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    'bgColor': Color(0xffFFF0EB),
  },
  {
    'salonName': 'Salon Butello',
    'rating': '4.6',
    'rateAmount': '15',
    'category': 'Hair Cut, Coloring',
    'imgUrl':
        'https://images.unsplash.com/photo-1527799820374-dcf8d9d4a388?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1611&q=80',
    'bgColor': Color(0xffEBF6FF),
  },
  {
    'salonName': 'Salon Opal',
    'rating': '4.7',
    'rateAmount': '18',
    'category': 'Massage, Facial',
    'imgUrl':
        'https://images.unsplash.com/photo-1632345031435-8727f6897d53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'bgColor': Color(0xffFFF0EB),
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'xsalonce',
      home: HomePage(),
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

  void fetchPosts() async {
    print("working");
    try {
      final response =
          await get(Uri.parse("https://jsonplaceholder.typicode.com/users/"));
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      setState(() {
        salonData1 = jsonData;
      });
      print(salonData1);
    } catch (err) {
      print(err);
    }
  }

  void initState() {
    fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 252, 92, 125),
                Color.fromARGB(255, 106, 130, 251),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.face_sharp,
            size: 40,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.purple,
        title: const Text(
          'Xsalonce',
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //   height: 300,
                      //   width: 300,
                      //   child: ListView.builder(
                      //       itemCount: salonData1.length,
                      //       itemBuilder: (context, index) {
                      //         return Container(
                      //           color: Colors.blue,
                      //           padding: EdgeInsets.all(5),
                      //           child: Card(
                      //               child: ListTile(
                      //             title: Text(salonData1[index]['name']),
                      //             subtitle: Text(salonData1[index]['email']),
                      //           )),
                      //         );
                      //       }),
                      // ),
                      const Text(
                        'Assist Your Every Appointment',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SalonCard(salonData[0]),
                      SalonCard(salonData[1]),
                      SalonCard(salonData[2]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalonCard extends StatelessWidget {
  final salon;

  HomePage homePage = new HomePage();

  SalonCard(this.salon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4 - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: salon['bgColor'],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: -6,
            width: 180.0,
            height: 90.0,
            child: Image.network(
              salon['imgUrl'],
              width: MediaQuery.of(context).size.width * 0.60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  salon['salonName'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Text(
                  salon['category'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      salon['rating'],
                      style: const TextStyle(
                        color: Color(0xff4E295B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SalonViewScreen(salon)));
                  },
                  color: const Color(0xff4E295B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Browse',
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
