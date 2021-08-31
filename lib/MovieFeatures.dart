
import 'package:flutter/cupertino.dart';

class Movies extends ChangeNotifier{
  String name;
  String description;
  int rating;

  Movies({this.name,this.description,this.rating});
}