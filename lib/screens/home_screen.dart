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

    'name': 'salon chathu',
    'address': '11/4 , Bodiligama Road , Katana',
    'location': {'latitude': 7.084, 'longitude': 80.0098},
    'nearest_city': 'Katana',
    'open_status': null,
    'description':
        'A beauty salon is an establishment that offers a variety of cosmetic treatments and cosmetic services for men and women. Beauty salons may offer a variety of services including professional hair cutting and styling, manicures and pedicures, and often cosmetics, makeup and makeovers.',
    'shedule': [
      {
        'date': 'Monday',
        'openTime': '10:00',
        'closeTime': '19:00',
        'open': true,
      },
      {
        'date': 'Tuesday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Wednesday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Thursday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Friday',
        'openTime': '06:00',
        'closeTime': '18:00',
        'open': true,
      },
      {
        'date': 'Saturday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Sunday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
    ],
    'about_us': null,
    'pro_pic_1':
        'https://res.cloudinary.com/xsalonce/image/upload/v1653639235/xsalonce_images/mf1clk4cwm3642eauxdc.jpg',
    'pro_pic_2':
        'https://res.cloudinary.com/xsalonce/image/upload/v1653639246/xsalonce_images/yqouxjtfhnpe25lpyc9r.jpg',
    'gallery': [],
    // 'category': ['Cleanup', 'Massage'],
    'owners_id': {},
    'product': []
  },
  {
    'salonName': 'Salon Butello',
    'rating': '4.6',
    'rateAmount': '15',
    'category': 'Hair Cut, Coloring',
    'imgUrl':
        'https://images.unsplash.com/photo-1527799820374-dcf8d9d4a388?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1611&q=80',
    'bgColor': Color(0xffEBF6FF),

    'name': 'hair with flair',
    'address': '78/4 , Dagonna Road , Minuwangoda',
    'location': {'latitude': 7.084, 'longitude': 80.0098},
    'nearest_city': 'Katana',
    'open_status': null,
    'description':
        'A beauty salon is an establishment that offers a variety of cosmetic treatments and cosmetic services for men and women. Beauty salons may offer a variety of services including professional hair cutting and styling, manicures and pedicures, and often cosmetics, makeup and makeovers.',
    'shedule': [
      {
        'date': 'Monday',
        'openTime': '10:00',
        'closeTime': '19:00',
        'open': true,
      },
      {
        'date': 'Tuesday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Wednesday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Thursday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Friday',
        'openTime': '06:00',
        'closeTime': '18:00',
        'open': true,
      },
      {
        'date': 'Saturday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Sunday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
    ],
    'about_us': null,
    'pro_pic_1':
        'https://res.cloudinary.com/xsalonce/image/upload/v1653639235/xsalonce_images/mf1clk4cwm3642eauxdc.jpg',
    'pro_pic_2':
        'https://res.cloudinary.com/xsalonce/image/upload/v1653639246/xsalonce_images/yqouxjtfhnpe25lpyc9r.jpg',
    'gallery': [],
    // 'category': ['Cleanup', 'Massage'],
    'owners_id': {},
    'product': []
  },
  {
    'salonName': 'Salon Opal',
    'rating': '4.7',
    'rateAmount': '18',
    'category': 'Massage, Facial',
    'imgUrl':
        'https://images.unsplash.com/photo-1632345031435-8727f6897d53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'bgColor': Color(0xffFFF0EB),

    'name': 'salon opal',
    'address': '11/4 , Oruthota Road , Gampaha',
    'location': {'latitude': 7.2008, 'longitude': 79.8737},
    'nearest_city': 'Katana',
    'open_status': null,
    'description':
        'A beauty salon is an establishment that offers a variety of cosmetic treatments and cosmetic services for men and women. Beauty salons may offer a variety of services including professional hair cutting and styling, manicures and pedicures, and often cosmetics, makeup and makeovers.',
    'shedule': [
      {
        'date': 'Monday',
        'openTime': '10:00',
        'closeTime': '19:00',
        'open': true,
      },
      {
        'date': 'Tuesday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Wednesday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Thursday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Friday',
        'openTime': '06:00',
        'closeTime': '18:00',
        'open': true,
      },
      {
        'date': 'Saturday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Sunday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
    ],
    'about_us': null,
    'pro_pic_1':
        'https://res.cloudinary.com/xsalonce/image/upload/v1653639235/xsalonce_images/mf1clk4cwm3642eauxdc.jpg',
    'pro_pic_2':
        'https://res.cloudinary.com/xsalonce/image/upload/v1653639246/xsalonce_images/yqouxjtfhnpe25lpyc9r.jpg',
    'gallery': [],
    // 'category': ['Cleanup', 'Massage'],
    'owners_id': {},
    'product': []
  },
  {
    'salonName': 'Salon GoodLook',
    'rating': '4.8',
    'rateAmount': '10',
    'category': 'Hair Cut, Facial',
    'imgUrl':
        'https://images.unsplash.com/photo-1616394584738-fc6e612e71b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    'bgColor': Color(0xffEBF6FF),

    'name': 'salon muthu',
    'address': '57/B , Aparekka Road , Ragama',
    'location': {'latitude': 7.2303, 'longitude': 80.0165},
    'nearest_city': 'Katana',
    'open_status': null,
    'description':
        'A beauty salon is an establishment that offers a variety of cosmetic treatments and cosmetic services for men and women. Beauty salons may offer a variety of services including professional hair cutting and styling, manicures and pedicures, and often cosmetics, makeup and makeovers.',
    'shedule': [
      {
        'date': 'Monday',
        'openTime': '10:00',
        'closeTime': '19:00',
        'open': true,
      },
      {
        'date': 'Tuesday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Wednesday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Thursday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Friday',
        'openTime': '06:00',
        'closeTime': '18:00',
        'open': true,
      },
      {
        'date': 'Saturday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
      {
        'date': 'Sunday',
        'openTime': '08:00',
        'closeTime': '21:00',
        'open': true,
      },
    ],
    'about_us': null,
    'pro_pic_1':
        'https://res.cloudinary.com/xsalonce/image/upload/v1653639235/xsalonce_images/mf1clk4cwm3642eauxdc.jpg',
    'pro_pic_2':
        'https://res.cloudinary.com/xsalonce/image/upload/v1653639246/xsalonce_images/yqouxjtfhnpe25lpyc9r.jpg',
    'gallery': [],
    // 'category': ['Cleanup', 'Massage'],
    'owners_id': {},
    'product': []
  }
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

  // void fetchPosts() async {
  //   print("working");
  //   try {
  //     final response =
  //         await get(Uri.parse("10.0.2.2://api/salon/owner/6285f0418a5f1935e3635473"));
  //     final jsonData = jsonDecode(response.body);
  //     print(jsonData);
  //     setState(() {
  //       salonData1 = jsonData;
  //     });
  //     print(salonData1);
  //   } catch (err) {
  //     print(err);
  //   }
  // }
  //
  // void initState() {
  //   fetchPosts();
  //   super.initState();
  // }

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
                        height: 40,
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
                      ListView.builder(
                          itemCount: salonData.length,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.blue,
                              padding: EdgeInsets.all(5),
                              child: SalonCard([index]),
                            );
                          }),
                      // SalonCard(salonData[0]),
                      // SalonCard(salonData[1]),
                      // SalonCard(salonData[2]),
                      // SalonCard(salonData[3]),
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

  SalonCard(this.salon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4 - 30,
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
            padding: const EdgeInsets.only(top: 40, left: 30),
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
                  height: 10,
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
                  height: 20,
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
