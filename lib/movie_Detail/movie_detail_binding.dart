import 'package:get/get.dart';
import 'package:getx2/movie_Detail/movie_detail_controller.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController());
  }
}
