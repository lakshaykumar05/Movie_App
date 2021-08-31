import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_list/MovieFeatures.dart';
import 'package:movie_list/ToDoModel.dart';
import 'package:movie_list/MovieDetailsScreen.dart';

class ShowMovie extends StatelessWidget {
  // const ShowMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Movies>(
        builder: (context,movie,child){
          return Card(
            // elevation: 20,
            child: SizedBox(
              height: 125,
              width: 200,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(movie.name,style: TextStyle(fontSize: 20),),
                        SizedBox(
                          width: 250,
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.details_rounded),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return MovieDetailsScreen(movie.name,movie.rating,movie.description);
                              }));
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Flexible(
                      child: Container(
                        child: Text(
                          movie.description,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 20.0,
                            // color: new Color(0xFF212121),
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
          // return ListTile(
          //   child: Center(
          //     child: Text(movie.name),
          //   ),
          //   footer: GridTileBar(
          //     title: Text(movie.description,textAlign: TextAlign.center,),
          //     backgroundColor: Colors.black54,
          //   ),
          // );
        },
    );
  }
}
