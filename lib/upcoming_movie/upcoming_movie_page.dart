import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx2/routes/app_route.dart';
import 'package:getx2/upcoming_movie/upcoming_movie_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/utils.dart';
import 'package:getx2/utils/constants.dart';

class UpcomingMoviePage extends StatelessWidget {
  const UpcomingMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpcomingMovieController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "Watch",
                style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
              ),
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ))
              ],
            ),
            body: controller.isloading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: controller.upcomingMovies.length,
                      physics: ScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.movieDetails, arguments: [
                              controller.upcomingMovies[index].id
                            ]);
                          },
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '$imageBaseUrl${controller.upcomingMovies[index].backdropPath}',
                                fit: BoxFit.cover,
                                height: Get.height * 0.3,
                                width: Get.width,
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight: Radius.circular(12.0)),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.7),
                                            Colors.transparent
                                          ])),
                                )),
                            Positioned(
                              bottom: 12,
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  controller
                                      .upcomingMovies[index].originalTitle,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ]),
                        );
                      }),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  )));
  }
}
