import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather/View/home_screen.dart';
import 'package:test_weather/controller/weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'weather App',
        home: BlocProvider(create: (_) => WeatherCubit(),
          child: const HomeScreen(),
        )
    );
  }
}
