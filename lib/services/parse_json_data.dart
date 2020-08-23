import 'package:convert/convert.dart';

class ParseJsonData {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  Wind wind;
  Clouds clouds;
  int dt, id, cod;
  Sys sys;
  String name;

  ParseJsonData(
      {this.coord,
        this.weather,
        this.base,
        this.main,
        this.wind,
        this.clouds,
        this.dt,
        this.sys,
        this.id,
        this.name,
        this.cod});

  ParseJsonData.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    clouds =
    json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
}

class Coord {
  dynamic lat;
  dynamic lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json){
    lat = json['lat'];
    lon = json['lon'];
  }
}

class Weather{
  int id;
  String main,description,icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic>json){
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Main {
  int temp;
  int pressure;
  int humidity;
  int tempMin;
  int tempMax;
  int seaLevel;
  int grndLevel;

  Main(
      {this.temp,
        this.pressure,
        this.humidity,
        this.tempMin,
        this.tempMax,
        this.seaLevel,
        this.grndLevel});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    pressure = json['pressure'] as int;
    humidity = json['humidity'] as int;
    tempMin = json['temp_min'] as int;
    tempMax = json['temp_max'] as int;
    seaLevel = json['sea_level'] as int;
    grndLevel = json['grnd_level'] as int;
  }
}

class Wind {
  dynamic speed;
  int deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }
}

class Clouds {
  int all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Sys {
  dynamic message;
  String country;
  int sunrise;
  int sunset;

  Sys({this.message, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}