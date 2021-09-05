import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDayTime; // true or false id daytime or not

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async {
    try {
      // make the request
      http.Response response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1, 3);
      String offsetMinutes = data['utc_offset'].substring(4, 6);
      // print('datetime: $datetime');
      // print('offset: $offset');

      // create a datetime object
      DateTime dateTimeObject = DateTime.parse(datetime);
      dateTimeObject = dateTimeObject.add(Duration(
          hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));
      // set the time property
      isDayTime =
          dateTimeObject.hour > 6 && dateTimeObject.hour < 19 ? true : false;
      time = DateFormat.jm().format(dateTimeObject);
    } catch (e) {
      print('caught error: $e');
      time = 'couldn\'t get time data';
    }
  }
}
