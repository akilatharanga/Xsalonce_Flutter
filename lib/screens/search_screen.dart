import 'package:flutter/material.dart';
import 'package:xsalonce_mobile/common/colors.dart';
import 'dart:convert';
import 'package:http/http.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // var salonData = [];
  // List<String> salonList = [];

  // void fetchPosts() async {
  //   print("working");
  //   try {
  //     final response = await get(Uri.parse(
  //         "https://xsalonce-backend.herokuapp.com/api/salon/owner/6285f0418a5f1935e3635473"));
  //
  //     // http://localhost:5000/api/salon/owner/6285f0418a5f1935e3635473
  //     final jsonData = jsonDecode(response.body);
  //     // print(jsonData);
  //     setState(() {
  //       salonData = jsonData;
  //     });
  //
  //     for (var i = 0; i < salonData.length; i++) {
  //       salonList[i] = salonData[i]['name'];
  //       // print(foodList[i]);
  //     }
  //     print(salonList);
  //     // print(foodList);
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  // @override
  // void initState() {
  //   fetchPosts();
  //   super.initState();
  // }

  List<String> salonList = [
    'Salon Chathu',
    'Salon KIK',
    'Salon AIA',
    'Good Look',
    'My Beauty',
    'Beauty Culture',
    'Salon Anoma',
    'Black Beans',
    'Thai Spa',
    'Salon Nandana',
    'Siripala',
    'Gihanthi',
    'Nethsara',
    'Hansani',
    'Chathura',
    'Nishan',
    'Salon Dassa',
    'Salon Bandara',
    'Salon ',
    'Herbal Spa',
    'Salon One',
    'Salon Madhara',
    'Salon Negombo',
    'Salon Vihara',
    'Next Level',
    'Salon Nethmi',
    'Olive oil',
    'Salon Imalsha',
    'Salon Chalaka',
    'Salon Ashen',
    'Salon Normal',
    'Leafy greens',
    'Bosses',
  ];

  List<String>? salonListSearch;

  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor1,
        title: Container(
          decoration: BoxDecoration(
            color: kColor1,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _textEditingController,
            focusNode: _textFocusNode,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Search here',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                contentPadding: EdgeInsets.all(8)),
            onChanged: (value) {
              setState(() {
                salonListSearch = salonList
                    .where((element) => element.contains(value.toLowerCase()))
                    .toList();
                if (_textEditingController!.text.isNotEmpty &&
                    salonListSearch!.length == 0) {
                  print('foodListSearch length ${salonListSearch!.length}');
                }
              });
            },
          ),
        ),
      ),
      body: _textEditingController!.text.isNotEmpty &&
              salonListSearch!.length == 0
          ? Center(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search_off,
                        size: 160,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'No results found,\nPlease try different name',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: _textEditingController!.text.isNotEmpty
                  ? salonListSearch!.length
                  : salonList.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.food_bank),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(_textEditingController!.text.isNotEmpty
                          ? salonListSearch![index]
                          : salonList[index])
                    ],
                  ),
                );
              },
            ),
    );
  }
}
