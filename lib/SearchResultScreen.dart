import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:music_sara/Bloc/search_bloc.dart';

import 'DetailsScreen.dart';

class SearchResultScreen extends StatefulWidget {
  // HomePageWidget();

  Map<String, dynamic> jsonResponse;
  String searchMethod;
  SearchResultScreen({required this.jsonResponse,required this.searchMethod});


  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List data=[];
  @override
  void initState() {
    data=widget.jsonResponse["results"]["${widget.searchMethod}matches"]["${widget.searchMethod}"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Search Result",style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [

              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,

                    itemCount: data.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(data[index])));

                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(image: NetworkImage(data[index]["image"][2]["#text"]))
                                ),
                              ),
                              SizedBox(width: 15,),
                              Expanded(child: Text(data[index]["name"]))

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
