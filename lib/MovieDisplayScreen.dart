import 'package:flutter/material.dart';
import 'package:movie_list/AddMyMovieScreen.dart';
import 'package:provider/provider.dart';
import 'package:movie_list/ToDoModel.dart';
import 'package:movie_list/MovieFeatures.dart';
import 'package:movie_list/ShowMovie.dart';

class HomeMovieDisplay extends StatelessWidget {
  // const MovieDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.,
        children: [
          Expanded(
            child: Scaffold(
                appBar: AppBar(
                  title: Text('My Movie List'),
                  centerTitle: true,
                ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<TodoModel>(
                  builder: (context,todo,child){
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(10.0),
                      itemCount: todo.movieList.length,
                      itemBuilder: (ctx,i) => ChangeNotifierProvider<Movies>.value(
                        value: todo.movieList[i],
                        child: ShowMovie(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          FlatButton(
            // minWidth: 100,
            height: 50,
            color: Colors.blue,
            child: Text('Add Movie'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AddMovieScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
