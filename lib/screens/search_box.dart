import 'package:flutter/material.dart';
import 'package:xsalonce_mobile/common/colors.dart';
import 'package:xsalonce_mobile/common/sizes.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:xsalonce_mobile/screens/salon_view_screen.dart';

const List<String> name = <String>[
  'Salon Chathu',
  'Salon Madhu',
  'Salon Sisila',
  'Salon Prithi'
];
const List<String> service = <String>[
  'Hair Cut',
  'Cleanup',
  'Nails',
  'Massage',
  'Bridal',
];
List<String> location = <String>[
  'Gampaha',
  'Colombo',
  'Matara',
  'Kadawatha',
  'Peradeniya',
  'Maharagama',
  'Anuradhappura',
  'Mawathagama',
  'Kurunegala',
  'Kegalle',
  'Galle',
  'Negombo',
  'Piliyandala',
  'Borella',
  'Maradana',
  'Madakalapuwa',
  'Thalawathugoda',
  'Jaffna',
  'Ampara'
];

// class SearchBox extends StatelessWidget {
//   const SearchBox({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  // var salonData1 = [];
  // var nCategory = [];
  // var categoryString;
  // var cityData = [];
  // var cityName = [];
  // var categorylen = [];
  //
  // void fetchPosts() async {
  //   // print("working");
  //   try {
  //     final responseCities = await get(
  //       Uri.parse("https://xsalonce-backend.herokuapp.com/api/get/cities"),
  //     );
  //
  //     final cityJsonData = jsonDecode(responseCities.body);
  //     // print(jsonData);
  //     setState(() {
  //       cityData = cityJsonData;
  //     });
  //
  //     cityData.forEach((element) {
  //       cityName = cityData[element]['name_en'];
  //     });
  //     print(cityName);
  //
  //     // print(salonData1);
  //     // print(nCategory);
  //     // print(categorylen);
  //   } catch (err) {
  //     print(err);
  //   }
  // }
  //
  // @override
  // void initState() {
  //   fetchPosts();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          // color: Colors.white,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          height: kVWidth(context, 0.9),
          width: kVWidth(context, 0.7),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  right: 10.0,
                  bottom: 20.0,
                  left: 10.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home_work_outlined,
                    size: 40,
                  ),
                  SizedBox(
                    width: kVWidth(context, 0.05),
                  ),
                  const Text(
                    'Search Salon',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: kVHeight(context, 0.05),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  right: 10.0,
                  left: 10.0,
                  bottom: 10.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 3,
                    color: Colors.black12,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const DropDownName(),
                    SizedBox(
                      height: kVHeight(context, 0.01),
                    ),
                    const DropDownService(),
                    SizedBox(
                      height: kVHeight(context, 0.01),
                    ),
                    const DropDownLocation(),
                    SizedBox(
                      height: kVHeight(context, 0.01),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SalonViewScreen([0])));
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                              top: 5.0,
                              bottom: 5.0,
                              right: 20.0,
                              left: 20.0,
                            ),
                            child: const Text(
                              'Search...',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropDownName extends StatefulWidget {
  const DropDownName({Key? key}) : super(key: key);

  @override
  State<DropDownName> createState() => _DropDownNameState();
}

class _DropDownNameState extends State<DropDownName> {
  String dropdownValue = name.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      menuMaxHeight: 200.0,
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_drop_down,
      ),
      elevation: 16,
      style: const TextStyle(
        color: Colors.deepPurple,
      ),
      // underline: Container(
      //   height: 2,
      //
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: name.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DropDownService extends StatefulWidget {
  const DropDownService({Key? key}) : super(key: key);

  @override
  State<DropDownService> createState() => _DropDownServiceState();
}

class _DropDownServiceState extends State<DropDownService> {
  String dropdownValue = service.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      menuMaxHeight: 200.0,
      icon: const Icon(
        Icons.arrow_drop_down,
      ),
      elevation: 16,
      style: const TextStyle(
        color: Colors.deepPurple,
      ),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: service.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DropDownLocation extends StatefulWidget {
  const DropDownLocation({Key? key}) : super(key: key);

  @override
  State<DropDownLocation> createState() => _DropDownLocationState();
}

class _DropDownLocationState extends State<DropDownLocation> {
  String dropdownValue = location.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      menuMaxHeight: 200.0,
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_drop_down,
      ),
      elevation: 16,
      style: const TextStyle(
        color: Colors.deepPurple,
      ),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: location.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            // overflow: TextOverflow.ellipsis,
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }
}
