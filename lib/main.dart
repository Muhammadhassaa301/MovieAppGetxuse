import 'package:flutter/material.dart';
import 'package:getx2/upcoming_movie/upcoming_movie_page.dart';
import 'package:get/get.dart';
import 'package:getx2/upcoming_movie/upcoming_movie_binding.dart';
import 'package:getx2/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      
      home: UpcomingMoviePage(),
      initialBinding: UpcomingMovieBinding(),
      getPages: AppPage.pages,
    );
  }
}
