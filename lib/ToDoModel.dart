import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MovieFeatures.dart';


class TodoModel extends ChangeNotifier{
    List<Movies>movieList=[];

    void addMovie(String Name,int Rating,String Description){
        Movies newMovie=Movies(name: Name,rating: Rating,description: Description);
        movieList.add(newMovie);
        notifyListeners();
    }

    void delMovie(String Name,int Rating,String Description){
        print(Name);
        print(Rating);
        print(Description);
        // Name="hh";
        // Description="kk";
        for(int i=0;i<movieList.length;i++){
            if(movieList[i].name==Name && movieList[i].rating==Rating && movieList[i].description==Description){
                movieList.remove(movieList[i]);
                break;
            }
        }
        notifyListeners();
    }

}