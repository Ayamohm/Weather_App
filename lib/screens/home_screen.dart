import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 1.2 * kToolbarHeight, 30, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // ===== الخلفيات الدائرية =====
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
                  decoration: const BoxDecoration(color: Colors.deepOrange),
                ),
              ),

              // ===== تأثير البلور =====
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 180, sigmaY: 180),
                child: Container(color: Colors.transparent),
              ),

              // ===== المحتوى الأساسي =====
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '📍 Cairo',
                    style: TextStyle(
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
                  // ===== صورة السحب أو الطقس =====
                  Center(
                    child: Image.asset(
                      'assets/69c39d325c7f551401a65cc1c43d0801-removebg-preview.png',
                      width: 250,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ===== درجة الحرارة =====
                  const Center(
                    child: Text(
                      '21°C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  // ===== نوع الطقس =====
                  const Center(
                    child: Text(
                      'Sunny',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // ===== التاريخ =====
                  const Center(
                    child: Text(
                      'Friday 16 .09.14',
                      style: TextStyle(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/pngtree-realistic-yellow-sun-3d-render-png-image_6258916.png', scale: 5,),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sunrise',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                          ),
                          Text('05:01',
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
                          Image.asset('assets/moon-3d-icon-illustration-free-png.webp', scale: 12,),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sunset',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                          ),
                          Text('09:15',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/3d-weather-icon-free-png.png', scale: 6,),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Temp Max',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                          ),
                          Text('30°C',
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
                          Image.asset('assets/3d-rendering-weather-thermometer-icon-forecast-climate-and-meteorology-icon-cold-temperature-symbol-illustration-png.png', scale: 5,),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Temp Min',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                          ),
                          Text('2°C',
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
}
