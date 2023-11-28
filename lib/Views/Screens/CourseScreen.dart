import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Controllers/BookmarkController.dart';
import 'package:it_grow_test/Controllers/CourseController.dart';
import 'package:it_grow_test/Controllers/VideoCompletionController.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';
import 'package:it_grow_test/Views/Widgets/CourseCompleteDialog.dart';
import 'package:it_grow_test/Views/Widgets/ShowSnackBar.dart';
import 'package:it_grow_test/Views/Widgets/BookmarkDialog.dart';
import 'package:pod_player/pod_player.dart';

class CourseScreen extends StatefulWidget {
  final Map course;

  const CourseScreen({super.key, required this.course});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  CourseController courseController = Get.put(CourseController());
  late final PodPlayerController videoController;
  int currentModule = 0, currentVideo = 0;
  Map isVideoWatched = {};

  @override
  void initState() {
    videoController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(currentVideoURL()),
        podPlayerConfig: const PodPlayerConfig(
            autoPlay: false,
            isLooping: false,
            videoQualityPriority: [720, 360]))
      ..initialise();

    allVideoStatus();

    videoController.addListener(() {
      if (videoController.currentVideoPosition.inHours ==
              videoController.totalVideoLength.inHours &&
          videoController.currentVideoPosition.inMinutes ==
              videoController.totalVideoLength.inMinutes &&
          videoController.currentVideoPosition.inSeconds ==
              videoController.totalVideoLength.inSeconds) {
        videoCompleted();
      }
    });

    setState(() {});

    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  String currentVideoURL() {
    return widget.course['videoLinks']
            ['M${currentModule}C${widget.course['id']}V$currentVideo'] ??
        'https://www.youtube.com/watch?v=CPlBi_gEToE&ab_channel=GoogleCareerCertificates';
  }

  allVideoStatus() async {
    isVideoWatched = await isVideoCompleted(widget.course);
    setState(() {
    });
  }

  videoCompleted() {
    try {
      videoController.pause();
      markVideoCompleted(widget.course, currentVideo, currentModule)
          .then((value) {
        ShowSnackBar(context, 'Marked As Completed', green);
        isCourseCompleted(widget.course).then((value) {
          if (value) {
            Future.delayed(
              const Duration(seconds: 3),
              () {
                Get.back();
                CourseCompleteDialog(widget.course);
              },
            );
          }
          allVideoStatus();
        });
      });
    } catch (error) {
      ShowSnackBar(context, error.toString(), red);
      debugPrint(error.toString());
    }
  }

  scroolToModule(int id) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Scrollable.ensureVisible(GlobalObjectKey(id).currentContext!,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 250)));
    currentVideo = 0;
    courseController.currentVideo.value = currentVideo;
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      iconTheme: const IconThemeData(color: white),
      centerTitle: true,
      title: Text('Course', style: TxtStyle(20, white, FontWeight.w500)),
      backgroundColor: logoColor,
      actions: [
        IconButton(
          icon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.bookmark,
              color: white,
            ),
          ),
          onPressed: () async {
            videoController.pause();
            BookmarkDialog(context, currentVideo, currentModule, widget.course,
                videoController);
          },
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        height:
            MediaQuery.of(context).size.height - appBar.preferredSize.height,
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.27,
              child: PodVideoPlayer(
                  controller: videoController,
                  onVideoError: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                          'Something went wrong : Check Internet connection',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TxtStyle(15, white, FontWeight.w500)),
                    );
                  },
                  videoTitle: Obx(() {
                    return Text(
                        'Module : ${courseController.currentModule + 1} Video : ${courseController.currentVideo + 1}',
                        style: TxtStyle(15, white, FontWeight.w500));
                  })),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.11,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ElevatedButton(
                  onPressed: () {
                    videoCompleted();
                  },
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(vertical: 10)),
                      backgroundColor: MaterialStatePropertyAll<Color>(green),
                      shape: MaterialStatePropertyAll<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('Mark As Completed',
                        textAlign: TextAlign.center,
                        style: TxtStyle(15, white, FontWeight.w500)),
                  )),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (currentModule > 0) {
                            scroolToModule(--currentModule);
                            courseController.currentModule.value =
                                currentModule;
                            videoController.changeVideo(
                                playerConfig:
                                    const PodPlayerConfig(autoPlay: false),
                                playVideoFrom:
                                    PlayVideoFrom.youtube(currentVideoURL()));
                          }
                        },
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(vertical: 10)),
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(black),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.keyboard_double_arrow_left_outlined,
                                color: white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('Previous\nModule',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TxtStyle(13, white, FontWeight.w500)),
                            ],
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          try {
                            createBookmark(
                                videoController.currentVideoPosition.toString(),
                                widget.course,
                                currentModule,
                                currentVideo);
                            ShowSnackBar(context, 'Bookmarked Added', green);
                          } catch (error) {
                            ShowSnackBar(context, error.toString(), red);
                          }
                        },
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.all(10)),
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(yellow),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))))),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: const Icon(
                            Icons.bookmark_add,
                            color: white,
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          if (currentModule <
                              widget.course['totalModule'] - 1) {
                            scroolToModule(++currentModule);
                            courseController.currentModule.value =
                                currentModule;
                            videoController.changeVideo(
                                playerConfig:
                                    const PodPlayerConfig(autoPlay: false),
                                playVideoFrom:
                                    PlayVideoFrom.youtube(currentVideoURL()));
                          }
                        },
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(vertical: 10)),
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(black),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Next\nModule',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TxtStyle(13, white, FontWeight.w500)),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.keyboard_double_arrow_right_outlined,
                                color: white,
                              ),
                            ],
                          ),
                        ))
                  ],
                )),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.42,
              child: ListView.builder(
                  itemBuilder: (context, moduleIndex) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            key: GlobalObjectKey(moduleIndex), //M --> module
                            color: skyBlue,
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text('Module: ${moduleIndex + 1}',
                                    style:
                                        TxtStyle(15, white, FontWeight.w500)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: ListView.separated(
                              itemBuilder: (context, videoIndex) {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {
                                      videoController.changeVideo(
                                          playerConfig: const PodPlayerConfig(
                                              autoPlay: false),
                                          playVideoFrom: PlayVideoFrom.youtube(
                                              currentVideoURL()));
                                      currentVideo = videoIndex;
                                      currentModule = moduleIndex;
                                      courseController.currentModule.value =
                                          currentModule;
                                      courseController.currentVideo.value =
                                          currentVideo;
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          (isVideoWatched.isNotEmpty)
                                              ? (((isVideoWatched[
                                                              'M${moduleIndex}C${widget.course['id']}V$videoIndex']) ??
                                                          0) ==
                                                      1)
                                                  ? Icons.check_circle
                                                  : Icons.circle_outlined
                                              : Icons.circle_outlined,
                                          color: green,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text('Video: ${videoIndex + 1}',
                                            style: TxtStyle(
                                                13, black, FontWeight.w500))
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: widget.course['chapters'][moduleIndex],
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  color: grey,
                                  thickness: 1,
                                  height: 0,
                                );
                              },
                              shrinkWrap: true,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: widget.course['totalModule']),
            ),
          ],
        ),
      ),
    );
  }
}
