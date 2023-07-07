import 'package:flutter/material.dart';
import 'package:world_time_app/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading';

  void setup_World_time() async{
    WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
    //Removes the route 'loading underneath and pushed Home route'
  }

  @override
  void initState() {
    super.initState();
    setup_World_time();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade700,
      body: const Center(
        child: SpinKitFadingCube(
          color: Colors.cyan,
          size: 50.0,
          duration: Duration(milliseconds: 500),
        ),
      )
    );
  }
}
