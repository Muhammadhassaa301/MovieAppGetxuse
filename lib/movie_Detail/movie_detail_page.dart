import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx2/main.dart';
import 'package:getx2/movie_Detail/movie_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:getx2/utils/constants.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailController>(
        builder: ((controller) => Scaffold(
              backgroundColor: Colors.white,
              body: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : NestedScrollView(
                      headerSliverBuilder:
                          ((BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            title: Text(
                              controller.movieData[0].originalTitle,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            expandedHeight: Get.height / 1.8,
                            floating: true,
                            pinned: true,
                            elevation: 0,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        '$imageBaseUrl${controller.movieData[0].backdropPath}',
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                    height: Get.height,
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                              Colors.black.withOpacity(0.7),
                                              Colors.transparent
                                            ])),
                                      ))
                                ],
                              ),
                              collapseMode: CollapseMode.parallax,
                            ),
                          )
                        ];
                      }),
                      body: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Overview',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              controller.movieData[0].overview,
                              style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.justify,
                            )
                          ],
                        ),
                      )),
            )));
  }
}
