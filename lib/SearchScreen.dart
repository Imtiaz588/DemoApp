import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:music_sara/Bloc/search_bloc.dart';
import 'package:music_sara/SearchResultScreen.dart';

class SearchScreen extends StatefulWidget {
  // HomePageWidget();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController();
  String radioBtn = "album";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Search  Music',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0xFF751010),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: TextFormField(
                  controller: textController,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: 'Type here',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),

                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Radio(
                        value: "album",
                        groupValue: radioBtn,

                        onChanged: (val) {
                          setState(() {
                            radioBtn = val.toString();
                          });
                        }
                    ),
                    Text("album")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: "artist",
                        groupValue: radioBtn,

                        onChanged: (val) {
                          setState(() {
                            radioBtn = val.toString();
                          });
                        }
                    ),
                    Text("artist")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: "track",
                        groupValue: radioBtn,

                        onChanged: (val) {
                          setState(() {
                            radioBtn = val.toString();
                          });
                        }
                    ),
                    Text("track")
                  ],
                ),
              ],
            ),
            BlocConsumer<SearchBloc, SearchState>(
              listener: (context, state) {
                if(state is SearchCompletedState){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchResultScreen(jsonResponse:state.jsonResponse,searchMethod: radioBtn,)));

                }
              },
              builder: (context, state) {

                if(state is LoadingState){
                  return Center(child: CircularProgressIndicator());
                }
                else{
                  return FlatButton(
                    onPressed: () async {

                      BlocProvider.of<SearchBloc>(context).add(SearchStartEvent(searchtext: textController.text,method: radioBtn));

                    },
                    child: Text("Search", style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),),
                    color: Colors.blue,
                  );
                }
              },
            ),
            // FlatButton(
            //   onPressed: () {
            //     print('Button pressed ...');
            //   },
            //   text: 'Search',
            //   options: FFButtonOptions(
            //     width: 130,
            //     height: 40,
            //     color: FlutterFlowTheme.primaryColor,
            //     textStyle: FlutterFlowTheme.subtitle2.override(
            //       fontFamily: 'Poppins',
            //       color: Colors.white,
            //     ),
            //     borderSide: BorderSide(
            //       color: Colors.transparent,
            //       width: 1,
            //     ),
            //     borderRadius: 12,
            //   ),
            //   loading: _loadingButton,
            // )
          ],
        ),
      ),
    );
  }
}
