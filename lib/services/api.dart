import 'dart:convert';

import 'package:empat_app/core/exceptions.dart';
import 'package:empat_app/core/extensions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

import '../models/weather.dart';
import '../models/dtos/weather_dto.dart';
import 'package:http/http.dart' as http;

import 'geo.dart';

class Api {
  static Future<Weather> loadCity(String city) async {
    final response = await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=db5e5707a26a4ed78a165055230304&q=$city&days=3&aqi=no&alerts=no"));
    if (response.statusCode != 200) {
      return Future.error(const ApiException(
          "Some error occured. Maybe the city name is not valid"));
    }
    return _getWeatherFromResponse(response);
  }

  static Future<Weather> loadWithLocation() async {
    try {
      final Position position = await Geo.getPosition();
      final String latLong = "${position.latitude},${position.longitude}";
      final Response response = await http.get(Uri.parse(
          "http://api.weatherapi.com/v1/forecast.json?key=db5e5707a26a4ed78a165055230304&q=$latLong&days=3&aqi=no&alerts=no"));

      return _getWeatherFromResponse(response);
    } on PermissionException catch (e) {
      return Future.error(e);
    }
  }

  static Future<Weather> _getWeatherFromResponse(Response response) async {
    final Map<String, dynamic> json = jsonDecode(response.body);
    final Map<String, dynamic> current = json['current'];
    current.putIfAbsent("location", () => json['location']);

    final List<dynamic> daysList = json["forecast"]["forecastday"];
    final convertedDays =
        daysList.map((value) => value as Map<String, dynamic>).toList();
    current.putIfAbsent("hours", () => convertedDays.getHours());
    current.putIfAbsent("days", () => convertedDays.getDays());

    return WeatherDto.fromJson(current).toWeather();
  }
}
