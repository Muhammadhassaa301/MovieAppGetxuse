import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:getx2/apis/movie_api.dart';
import 'package:getx2/models/movie_details_model.dart';

class MovieDetailController extends GetxController {
  int movieId = Get.arguments(0);
  MovieApi movieApi = MovieApi();

  bool isLoading = true;
  List<MovieDetailsModel> movieData = [];

  @override
  void onInit() {
    super.onInit();
  }

  void fetchMovieDetails() async {
    var response = await movieApi.getMovieDetails(movieId: movieId);

    if (response != null) {
      movieData.add(MovieDetailsModel.fromMap(response));
      isLoading = false;
      update();
    }
  }
}
