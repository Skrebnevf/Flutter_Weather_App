import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      cursorColor: Colors.red,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Enter City Name',
                          hintStyle: TextStyle(color: Colors.black, shadows: [
                            Shadow(
                                color: Colors.black38,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 9)
                          ]),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(width: 2, color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(width: 2, color: Colors.red),
                          ),
                          icon: Icon(
                            TablerIcons.home_2,
                            color: Colors.red,
                            size: 40,
                          )),
                      onChanged: (value) {
                        cityName = value;
                      },
                    ),
                  ),
                ),
                TextButton(
                  child: Text(
                    'Get Weather',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                              color: Colors.black38,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5)
                        ]),
                  ),
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
