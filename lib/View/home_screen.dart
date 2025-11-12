import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather/controller/weather_state.dart';

import '../controller/weather_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit()..fetchWeather(),

      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          // loading /////////////////////////////////////
          if (state is WeatherLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
            // error /////////////////////////////////////
          } else if (state is WeatherError) {
            return Scaffold(
              body: Center(child: Text(state.message)),
            );
            // loaded /////////////////////////////////////
          }


          else if (state is WeatherLoaded) {
            final weather = state.weather;

            return Scaffold(
              backgroundColor: Colors.black,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(
                    30, 1.2 * kToolbarHeight, 30, 20),
                child: SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: Stack(
                    children: [
                      // ===== bluring background=====
                      Align(
                        alignment: const AlignmentDirectional(3, -0.3),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-3, -0.3),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, -1.6),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                              color: Colors.deepOrange),
                        ),
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 180, sigmaY: 180),
                        child: Container(color: Colors.transparent),
                      ),
                      // ===== body =====
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📍 ${weather.city}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Good Morning',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          // ===== =====
                          Center(
                            child: Image.asset(
                              '3d-render-rainy-weather-icon-realistic-raindrops-and-cloud-symbol-of-storm-autumn-season-meteorology-weather-forecast-illustration-about-rain-vector-removebg-preview - Copy.png',
                              width: 250,
                              height: 250,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 20),
                          //temp////////////////////////////////

                          Center(
                            child: Text(
                              '${weather.temp.toInt()}°C',
                              style:TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // ===== نوع الطقس =====
                           Center(
                            child: Text(
                              weather.condition,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          // ===== date =====
                          Center(
                            child: Text(
                              '${now.day}-${now.month}-${now.year}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/pngtree-realistic-yellow-sun-3d-render-png-image_6258916.png',
                                        scale: 5,),
                                      const SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text('Sunrise',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text('${weather.sunrise.hour}:${weather.sunrise.minute}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/moon-3d-icon-illustration-free-png.webp',
                                        scale: 12,),
                                      const SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text('Sunset',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text('${weather.sunset.hour}:${weather.sunset.minute}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Divider(
                                  color: Colors.grey[900],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/3d-weather-icon-free-png.png',
                                        scale: 6,),
                                      const SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text('Temp Max',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text('${weather.tempMax}°C',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/3d-rendering-weather-thermometer-icon-forecast-climate-and-meteorology-icon-cold-temperature-symbol-illustration-png.png',
                                        scale: 5,),
                                      const SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text('Temp Min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text('${weather.tempMin}°C',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),

                                ],
                              )
                            ],
                          )

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        }
            )
    );
  }
}