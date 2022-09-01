import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import '../common/sizes.dart';
import 'package:snippet_coder_utils/list_helper.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: kVWidth(context, 1),
            height: kVHeight(context, 0.5),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/image1.png",
                    fit: BoxFit.contain,
                    width: kVWidth(context, 0.8),
                  ),
                )
              ],
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(
          //     left: 20,
          //     bottom: 30,
          //     top: 50,
          //   ),
          //   child: Text(
          //     "Login",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 25,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          // FormHelper.inputFieldWidget(
          //   context,
          //   "username",
          //   "Username",
          //       (onValidateVal) {
          //     if (onValidateVal.isEmpty) {
          //       return "Username can\'t be empty.";
          //     } else {
          //       return null;
          //     }
          //   },
          //       (onSavedVal) {
          //     username = onSavedVal;
          //   },
          //   borderFocusColor: Colors.white,
          //   prefixIconColor: Colors.white,
          //   borderColor: Colors.white,
          //   textColor: Colors.white,
          //   hintColor: Colors.white.withOpacity(0.7),
          //   borderRadius: 10,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: FormHelper.inputFieldWidget(
          //     context,
          //     "password",
          //     "Password",
          //         (onValidateVal) {
          //       if (onValidateVal.isEmpty) {
          //         return "Password can\'t be empty.";
          //       } else {
          //         return null;
          //       }
          //     },
          //         (onSavedVal) {
          //       password = onSavedVal;
          //     },
          //     borderFocusColor: Colors.white,
          //     prefixIconColor: Colors.white,
          //     borderColor: Colors.white,
          //     textColor: Colors.white,
          //     hintColor: Colors.white.withOpacity(0.7),
          //     borderRadius: 10,
          //     obscureText: hidePassword,
          //     suffixIcon: IconButton(
          //       onPressed: () {
          //         hidePassword = !hidePassword;
          //       },
          //       color: Colors.white.withOpacity(0.7),
          //       icon: Icon(
          //         hidePassword ? Icons.visibility_off : Icons.visibility,
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Text('XSalonce',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.0,color: Colors.white),),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: FormHelper.submitButton("Browse Salons", () {
              Navigator.pushNamed(context, "/home_screen");
            },
                btnColor: HexColor("#283B71"),
                borderColor: Colors.white,
                txtColor: Colors.white,
                borderRadius: 10),
          )
        ],
      ),
    );
  }
}
