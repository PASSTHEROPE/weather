import 'package:flutter/material.dart';
import 'package:weather/pages/weatherdetect.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  late final TextEditingController _controller;
  bool isCityNameEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();

    _controller.addListener(() {
      setState((() => isCityNameEmpty = _controller.text.isEmpty)); {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('city name'),
    SizedBox(height: 20),
    Padding(
    padding: const EdgeInsets.all(16),
    child: TextField(
      controller: _controller,
    decoration: InputDecoration(
    hintText: 'city name',
    border: OutlineInputBorder(),
    ),

    ),
    ),
          ElevatedButton(onPressed : isCityNameEmpty? null: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WeatherDetail(
                cityName: _controller.text,
              ))
            );
          }, child: const Text ("FIND")),
        ],
    ),
    ),
  );
  }
}
