import 'package:flutter/cupertino.dart';

double kVWidth(BuildContext context, double precentage) =>
    MediaQuery.of(context).size.width * precentage;

double kVHeight(BuildContext context, double precentage) =>
    MediaQuery.of(context).size.height * precentage;