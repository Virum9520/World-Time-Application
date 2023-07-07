import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String? location;  //location name for the UI
  String? time;      //time at that location
  String? flag;      //Url to an asset flag icon
  String? url;       //Url of api location
  bool? isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{

    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);
    String datetime = data['datetime'];
    // print(datetime);
    String offset = data['utc_offset'].substring(1,3);
    // print(offset);


    //create datetime object to convert data into time format

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    // print(now);

    isDaytime = now.hour > 7 && now.hour < 19 ? true : false;
    time = DateFormat.jm().format(now);
  }
}
