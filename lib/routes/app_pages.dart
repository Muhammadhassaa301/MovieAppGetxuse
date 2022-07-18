import 'package:getx2/movie_Detail/movie_detail_page.dart';
import 'package:getx2/routes/app_route.dart';
import 'package:getx2/upcoming_movie/upcoming_movie_page.dart';
import 'package:get/get.dart';
import 'package:getx2/upcoming_movie/upcoming_movie_binding.dart';
import 'package:getx2/movie_Detail/movie_detail_binding.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.upcomingMovie,
      page: () => UpcomingMoviePage(),
      binding: UpcomingMovieBinding()
    ),
    GetPage(name: AppRoutes.upcomingMovie, 
    page: () => MovieDetailPage(),
    binding: MovieDetailsBinding()
    ),


  ];
}
