import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag; //url to asset flag icon
  String url; //location url for api endpoint
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);     

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      //now.add(Duration(hours: int.parse(offset)));

     int offSetTime =  int.parse(offset);
     print("offaet");
     print(offSetTime);

     //need curretn pffset

      time = DateFormat.jm().format(now.add(Duration(hours: int.parse(offset))));

      print("time");
      print(time);
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
     

    } catch (e) {
     
      time = "Could not get time data!";
    }
  }
}
