import 'package:cms/dbHelper/mongodb.dart';
import 'package:cms/pages/Sections/Student/Add/add_MongoDBModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayStudent extends StatefulWidget {
  const DisplayStudent({Key? key}) : super(key: key);

  @override
  State<DisplayStudent> createState() => _DisplayStudentState();
}

class _DisplayStudentState extends State<DisplayStudent> {
  @override
  Widget build(BuildContext context) {
    //                            TODO: DISPLAY FUNCTION
    return  Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
                future: MongoDatabase.getData(),
                builder: (context,AsyncSnapshot snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
        }
        else{
              if(snapshot.hasData){
              var totalData = snapshot.data.length;
              print(totalData.toString());
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return displayCard(add_MongoDBModel.fromJson(snapshot.data[index]));

              });
              }
              else{
                return Center(child: Text("No Data Available"),
                );
              }
        }
      }),
          )),
    );
  }

  //                            TODO:DISPLAY CARD
  Widget displayCard(add_MongoDBModel data){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${data.id}"),
            const SizedBox(height: 5,),
            Text("First Name = ${data.firstName}"),
            const SizedBox(height: 5,),
            Text("Last Name = ${data.lastName}"),
            const SizedBox(height: 5,),
            Text("DOB= ${data.date}"),
          ],
        ),
      ),
    );
  }
}


