import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:music_sara/Bloc/search_bloc.dart';

class DetailsScreen extends StatefulWidget {

  final data;
  DetailsScreen(this.data);
  // HomePageWidget();
  //
  // Map<String, dynamic> jsonResponse;
  // String searchMethod;
  // DetailsScreen({required this.jsonResponse,required this.searchMethod});


  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List data=[];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(image: NetworkImage(widget.data["image"][2]["#text"]),fit: BoxFit.fill)
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("Name:",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),

                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width*0.8,
                                child: Text(widget.data["name"],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)),
                          ],
                        ),
                        Row(
                          children: [

                            Text("Artist:",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),

                            Container(
                                padding: EdgeInsets.only(left: 10),

                                width: MediaQuery.of(context).size.width*0.8,
                                child: Text(widget.data["artist"],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)),
                          ],
                        ),
                        Row(
                          children: [

                            Text("Artist:",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),

                            Container(
                                padding: EdgeInsets.only(left: 10),

                                width: MediaQuery.of(context).size.width*0.8,

                                child: Text(widget.data["url"],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)),
                          ],
                        )

                      ],
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
