import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Controllers/BookmarkController.dart';
import 'package:it_grow_test/Controllers/TimeStampToDuration.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';
import 'package:pod_player/pod_player.dart';

BookmarkDialog(BuildContext context, int currentVideo, int currentModule,
    Map course, PodPlayerController videoController) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: yellow,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              'Module: ${currentModule + 1} Video: ${currentVideo + 1} All Bookmarks',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TxtStyle(13, white, FontWeight.w500)),
        ),
        content: Container(
          color: white,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.6,
          child: FutureBuilder(
            future: fetchBookmarks(course, currentModule, currentVideo),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                String bookmark = snapshot.data ?? '';
                List<String> bookmarkList = bookmark.split('/');

                if (bookmark == '') {
                  return Center(
                    child: Text(
                        'No Bookmark added',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TxtStyle(15, black, FontWeight.w500)),
                  );
                }

                return ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                videoController.videoSeekTo(
                                    parseDuration(bookmarkList[index]));
                                videoController.play();
                                Get.back();
                              },
                              child: Text(bookmarkList[index],
                                  style: TxtStyle(13, black, FontWeight.w500)),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: black,
                              ),
                              onPressed: () async {
                                await deleteBookmark(bookmarkList[index],
                                    course, currentModule, currentVideo);
                                Get.back();
                              },
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: grey,
                        thickness: 1,
                        height: 0,
                      );
                    },
                    itemCount: bookmarkList.length);
              } else {
                return Container();
              }
            },
          ),
        ),
      );
    },
  );
}
