import 'package:flutter/material.dart';
import 'package:flutter_projects/features/home/presentation/views/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFFFFFFF),
            useMaterial3: true,
          ),
          home: HomeView(),
        );
      },
    );
  }
}
