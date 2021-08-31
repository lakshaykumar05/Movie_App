import 'package:flutter/material.dart';
import 'package:movie_list/ToDoModel.dart';
import 'package:provider/provider.dart';
import 'package:movie_list/AddMyMovieScreen.dart';
import 'package:movie_list/ToDoModel.dart';

import 'MovieDisplayScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: ChangeNotifierProvider(
        create: (context) => TodoModel(),
        child: MaterialApp(
          theme: ThemeData.dark(),
          home: AddMovieScreen(),
        ),
      ),
    );
  }
}

