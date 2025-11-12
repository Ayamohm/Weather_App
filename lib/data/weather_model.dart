class WeatherModel {
  final String city;
  final double temp;
  final String condition;
  final String icon;
  final DateTime sunrise;
  final DateTime sunset;
  final double tempMax;
  final double tempMin;


  WeatherModel({
    required this.city,
    required this.temp,
    required this.condition,
    required this.icon,
    required this.sunrise,
    required this.sunset,
    required this.tempMax,
    required this.tempMin,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temp: (json['main']['temp'] - 273.15), // Kelvin to Celsius
      condition: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      tempMax: json['main']['temp_max'],
      tempMin: json['main']['temp_min'],
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000),
    );
  }

  String get iconUrl => 'https://openweathermap.org/img/wn/$icon@2x.png';
}
