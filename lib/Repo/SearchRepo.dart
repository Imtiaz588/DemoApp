import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SearchRepo{
  String key="acdfa48716ce409220d1d831e8f19823&format=json";



  Future<Map<String, dynamic>?> SearchMusic(String searchText,String method) async {
    String url = "https://ws.audioscrobbler.com/2.0/?method=${method}.search&${method}=${searchText}&api_key=";

    var response = await http.get(Uri.parse(url+key));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Request failed with status: ${response
          .statusCode}.');
      return null;
    }
  }

}