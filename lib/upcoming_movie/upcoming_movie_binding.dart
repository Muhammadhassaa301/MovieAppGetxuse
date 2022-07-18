import 'package:get/get.dart';
import 'package:getx2/upcoming_movie/upcoming_movie_controller.dart';

class UpcomingMovieBinding extends Bindings {
  void dependencies() {
    Get.lazyPut(() => UpcomingMovieController());
  }
}
