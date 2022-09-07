import 'package:flutter/material.dart';

class SalonViewScreen extends StatelessWidget {
  final salon;



  SalonViewScreen(this.salon);

  var serviceList = [
    {'title': 'Men\s Hair Cut', 'duration': 45, 'price': 300},
    {'title': 'Women\s Hair Cut', 'duration': 60, 'price': 500},
    {'title': 'Color & Blow Dry', 'duration': 90, 'price': 750},
    {'title': 'Oil Treatment', 'duration': 30, 'price': 200},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3 + 40,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        // 'assets/images/image1.png',
                        'https://images.unsplash.com/photo-1580618672591-eb180b1a973f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80',
                        fit: BoxFit.fill,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.purple.withOpacity(0.1),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 5,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3 - 40,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          const Text(
                            'Services List',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // ServiceTile(serviceList[0]),
                          // ServiceTile(serviceList[1]),
                          // ServiceTile(serviceList[2]),
                          // ServiceTile(serviceList[3]),
                          ListView.builder(itemBuilder: (context,index){
                            return ServiceTile(serviceList[index]);
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3 - 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          height: MediaQuery.of(context).size.height / 6 + 20,
                          decoration: BoxDecoration(
                            color: salon['bgColor'],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                child: Image.network(
                                  salon['imgUrl'],
                                  scale: 1.7,
                                ),
                                // top: 10,
                                // right: -25,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              salon['salonName'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              salon['category'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
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
                                  color: Color(0xffFF8573),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  salon['rating'],
                                  style: const TextStyle(
                                    color: Color(0xffFF8573),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '(${salon['rateAmount']})',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  top: MediaQuery.of(context).size.height / 3 - 40,
                  child: MaterialButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(10),
                    shape: const CircleBorder(),
                    color: Colors.white,
                    child: const Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final service;

  ServiceTile(this.service);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 40,
                child: Text(
                  service['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${service['duration']} Min',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            'Rs. ${service['price']}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: const Color(0xffFF8573),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Book',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
