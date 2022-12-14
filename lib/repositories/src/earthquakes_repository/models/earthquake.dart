import 'package:learn/repositories/src/earthquakes_repository/models/coordinates.dart';

class Earthquake {
  Earthquake({
    required this.coordinates,
    required this.date,
    required this.magnitude,
    required this.id,
    required this.location,
  });

  // factory Earthquake.fromJson(dynamic json) {
  //   return Earthquake(
  //     coordinates: Coordinates(
  //       latitude: json['features'][0]['geometry']['coordinates'][1] as double,
  //       longitude: json['features'][0]['geometry']['coordinates'][0] as double,
  //       depth: json['features'][0]['geometry']['coordinates'][2] as double,
  //     ),
  //     date: DateTime.fromMillisecondsSinceEpoch(
  //       json['features'][0]['properties']['time'] as int,
  //     ),
  //     magnitude: json['features'][0]['properties']['mag'] as double,
  //     id: json['features'][0]['id'].toString(),
  //     location: json['features'][0]['properties']['place'].toString(),
  //   );
  // }

  final Coordinates coordinates;
  final DateTime date;
  final double magnitude;
  final String id;
  final String location;
}
