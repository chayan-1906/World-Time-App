import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime('London', 'uk.png', 'Europe/London'),
    WorldTime('Berlin', 'greece.png', 'Europe/Berlin'),
    WorldTime('Cairo', 'egypt.png', 'Africa/Cairo'),
    WorldTime('Nairobi', 'kenya.png', 'Africa/Nairobi'),
    WorldTime('Chicago', 'usa.png', 'America/Chicago'),
    WorldTime('New York', 'usa.png', 'America/New_York'),
    WorldTime('Seoul', 'south_korea.png', 'Asia/Seoul'),
    WorldTime('Jakarta', 'indonesia.png', 'Asia/Jakarta'),
    WorldTime('India', 'india.png', 'Asia/Kolkata'),
    WorldTime('Johannesburg', 'johannesburg.png', 'Africa/Johannesburg'),
    WorldTime('Los Angeles', 'los_angeles.png', 'America/Los_Angeles'),
    WorldTime('Mexico', 'mexico.png', 'America/Mexico_City'),
    WorldTime('Karachi', 'pakistan.png', 'Asia/Karachi'),
    WorldTime('Kathmandu', 'nepal.png', 'Asia/Kathmandu'),
    WorldTime('Kuala Lumpur', 'malaysia.png', 'Asia/Kuala_Lumpur'),
    WorldTime('Qatar', 'qatar.png', 'Asia/Qatar'),
    WorldTime('Singapore', 'singapore.png', 'Asia/Singapore'),
    WorldTime('Tokyo', 'japan.png', 'Asia/Tokyo'),
    WorldTime('Adelaide', 'australia.png', 'Australia/Adelaide'),
    WorldTime('Brisbane', 'australia.png', 'Australia/Brisbane'),
    WorldTime('Melbourne', 'australia.png', 'Australia/Melbourne'),
    WorldTime('Perth', 'australia.png', 'Australia/Perth'),
    WorldTime('Sydney', 'australia.png', 'Australia/Sydney'),
    WorldTime('Paris', 'france.png', 'Europe/Paris'),
    WorldTime('Rome', 'italy.png', 'Europe/Rome'),
    WorldTime('Vienna', 'austria.png', 'Europe/Vienna'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
