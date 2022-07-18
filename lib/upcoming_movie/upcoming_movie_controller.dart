import 'package:get/get.dart';
import 'package:getx2/models/upcoming_movie_model.dart';
import 'package:getx2/apis/movie_api.dart';

class UpcomingMovieController extends GetxController {
  List<UpcomingMovieModel> upcomingMovies = [];
  MovieApi movieApi = MovieApi();
  bool isloading = true;
  @override
  void onInit() {
    super.onInit();
    fetchUpcomingMovies();
  }

  void fetchUpcomingMovies() async {
    var response = await movieApi.getUpcomingMovies();
    if (response != null) {
      response['results'].forEach((data) {
        upcomingMovies.add(UpcomingMovieModel.fromMap(data));
      });

      isloading = false;
      update();
    }
  }
}
