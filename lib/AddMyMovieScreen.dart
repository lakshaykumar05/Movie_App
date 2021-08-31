import 'package:flutter/material.dart';
import 'package:movie_list/ToDoModel.dart';
import 'package:provider/provider.dart';
import 'MovieDisplayScreen.dart';
import 'dart:async';

class AddMovieScreen extends StatelessWidget {
  // const AddMovie({Key? key}) : super(key: key);

  TextEditingController textOfNameController = TextEditingController();

  TextEditingController textOfDescriptionController = TextEditingController();
  String name,description;
  int rating=0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Movie'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:18.0,left: 18.0),
            child: Text('Name',style: TextStyle(fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:18.0,top: 5,right: 18),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              controller: textOfNameController,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:18.0,left: 18.0),
                  child: Text('Rating',style: TextStyle(fontSize: 20),),
                ),

              ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top:18.0,left: 18.0),
            child: Text('Description',style: TextStyle(fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:18.0,top: 5,right: 18),
            child: Container(
              child: TextField(
                maxLines: 17,
                keyboardType: TextInputType.multiline,
                // expands: true,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Description',
                  // hintMaxLines: null,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                controller: textOfDescriptionController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(

              child: ElevatedButton(

                child: Text('Add Movie',style: TextStyle(color: Colors.black38),),
                onPressed: () {
                  name=textOfNameController.text;
                  description=textOfDescriptionController.text;

                  if(name.isEmpty || description.isEmpty){
                    showDialog(context: context,
                      builder: (BuildContext context)=> PopUpDialogNo(context),
                    );
                  }
                  else{
                    // Provider.of<TodoModel>(context,listen: false).addMovie(name,rating,description);
                    showDialog(context: context,
                        // Provider.of<TodoModel>(context,listen: false).addMovie(name,rating,description);
                      builder: (BuildContext context)=> PopUpDialog(context),
                    );
                    Provider.of<TodoModel>(context,listen: false).addMovie(name,rating,description);
                    Navigator.push(context , MaterialPageRoute(builder: (context){
                      return HomeMovieDisplay();
                    },
                    ),
                    );
                  }
                  },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget PopUpDialog(BuildContext context){
  return new AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Center(
        child: Text('Are you sure you want to add a Movie?',style: TextStyle(fontSize: 20),),
      ),
    actions: <Widget>[
      new ElevatedButton(
        onPressed: (){
        //   Navigator.push(context , MaterialPageRoute(builder: (context){
        //     return MovieDisplay();
        //   },
        //   ),
        //   );
          Navigator.of(context).pop();
        },
          // textColor: Theme.of(context).primaryColor,
        child: Center(child: Text('Yes',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
      ),
    ],
  );
}

Widget PopUpDialogNo(BuildContext context){
  return new AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    title: Text('Movie Name and Description cannot be empty.',style: TextStyle(fontSize: 20),),
    actions: <Widget>[
      Center(
        child: new RaisedButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OK',style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    ],
  );
}
