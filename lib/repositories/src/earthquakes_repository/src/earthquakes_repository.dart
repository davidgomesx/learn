import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn/repositories/src/earthquakes_repository/earthquakes_repository.dart';

Future<List<Earthquake>> fetchEarthquakes() async {
  final response = await http.get(
    Uri.parse(
      'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2022-12-12&endtime=2022-12-13',
    ),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    final earthquakes = <Earthquake>[];

    final json = jsonDecode(response.body);

    final count = json['metadata']['count'] as int;

    for (var i = 0; i < count; i++) {
      final longitude =
          checkDouble(json['features'][i]['geometry']['coordinates'][0]);

      final latitude =
          checkDouble(json['features'][i]['geometry']['coordinates'][1]);
      final depth =
          checkDouble(json['features'][i]['geometry']['coordinates'][2]);

      final dateRawEpoch = json['features'][i]['properties']['time'] as int;
      final dateEpoch = checkInt(dateRawEpoch);
      final date = DateTime.fromMillisecondsSinceEpoch(dateEpoch!);

      final magnitude = checkDouble(json['features'][i]['properties']['mag']);

      final id = json['features'][i]['id'].toString();
      // print('id-> $id');

      final location = json['features'][i]['properties']['place'].toString();

      final coordinates = Coordinates(
        latitude: latitude!,
        longitude: longitude!,
        depth: depth!,
      );
      final earthquake = Earthquake(
        coordinates: coordinates,
        date: date,
        magnitude: magnitude!,
        id: id,
        location: location,
      );

      earthquakes.add(earthquake);
    }

    return earthquakes;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

double? checkDouble(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

int? checkInt(dynamic value) {
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
