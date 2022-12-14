import 'package:flutter/material.dart';
import 'package:learn/repositories/src/earthquakes_repository/earthquakes_repository.dart';
import 'package:learn/ui/ui.dart';

class EarthquakesPage extends StatefulWidget {
  const EarthquakesPage({super.key});

  @override
  State<EarthquakesPage> createState() => _EarthquakesPageState();
}

class _EarthquakesPageState extends State<EarthquakesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('earthquakes'),
              UiButton.compact(
                color: Colors.black,
                onPressed: () {
                  final list = fetchEarthquakes();

                  print(list.toString());
                  print('conseguir ir buscar os terramotos');
                },
                text: 'fetch data',
              )
            ],
          ),
        ),
      ),
    );
  }
}
