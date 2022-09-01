import 'package:flutter/material.dart';
import 'package:xsalonce_mobile/common/sizes.dart';
import 'package:http/http.dart';
import 'dart:convert';

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
const List<String> location = <String>[
  'Gampaha',
  'Colombo',
  'Matara',
  'Kadawatha',
  'Peradeniya',
  'Kadawatha1',
  'Kadawatha2',
  'Kadawatha3',
  'Kadawatha4',
  'Kadawatha5',
  'Kadawatha6',
  'Kadawatha7',
  'Kadawatha8',
  'Kadawatha9',
  'Kadawatha10',
  'Kadawatha11',
  'Kadawatha12',
  'Kadawatha13',
  'Kadawatha14'
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

  var salonData1 = [];
  var nCategory = [];
  var categoryString;
  var categorylen = [];

  void fetchPosts() async {
    // print("working");
    try {
      final response = await get(Uri.parse(
          "https://xsalonce-backend.herokuapp.com/api/salon/owner/6285f0418a5f1935e3635473"));

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
      // backgroundColor: Colors.purple.shade200,
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
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                  right: 10.0,
                  bottom: 20.0,
                  left: 10.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_work_outlined,
                    size: 40,
                  ),
                  SizedBox(
                    width: kVWidth(context, 0.05),
                  ),
                  Text(
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
                padding: EdgeInsets.only(
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
                    DropDownName(),
                    SizedBox(
                      height: kVHeight(context, 0.01),
                    ),
                    DropDownService(),
                    SizedBox(
                      height: kVHeight(context, 0.01),
                    ),
                    DropDownLocation(),
                    SizedBox(
                      height: kVHeight(context, 0.01),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Container(
                            margin: EdgeInsets.only(
                              top: 5.0,
                              bottom: 5.0,
                              right: 20.0,
                              left: 20.0,
                            ),
                            child: Text(
                              'Search...',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
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
            style: TextStyle(
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
            style: TextStyle(
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
            style: TextStyle(
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
