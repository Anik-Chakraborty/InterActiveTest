import 'package:it_grow_test/Data/Database/SQLHelper.dart';

createBookmark(String timeStamp, Map course, int moduleId, int videoId) async {
  //get bookmarks,
  String bookmarks = await fetchBookmarks(course, moduleId, videoId);
  //add bookmarks
  List<String> bookmarkList = bookmarks.split('/');
  bookmarkList.add(timeStamp);

  String updatedBookmarks = '';

  if (bookmarkList[0] != '') {
    updatedBookmarks = bookmarkList[0];
  }
  for (int i = 1; i < bookmarkList.length; i++) {
    if (updatedBookmarks == '') {
      updatedBookmarks += bookmarkList[i];
    } else {
      updatedBookmarks += '/${bookmarkList[i]}';
    }
  }

  //update db
  Map<String, dynamic> value = {
    'video_id': videoId,
    'course_id': course['id'],
    'module_id': moduleId,
    'bookmarks': updatedBookmarks,
  };

  await SQLHelper.update(value, 'M${moduleId}C${course['id']}V$videoId');
}

deleteBookmark(String timeStamp, Map course, int moduleId, int videoId) async {
  //get bookmarks,
  String bookmarks = await fetchBookmarks(course, moduleId, videoId);

  //remove bookmarks
  List<String> bookmarkList = bookmarks.split('/');
  if (bookmarkList.isNotEmpty && bookmarkList.contains(timeStamp)) {
    bookmarkList.remove(timeStamp);
  }

  String updatedBookmarks = '';
  for (int i = 0; i < bookmarkList.length; i++) {
    if (i == 0) {
      updatedBookmarks = bookmarkList[i];
    } else {
      updatedBookmarks += '/${bookmarkList[i]}';
    }
  }

  //update db
  Map<String, dynamic> value = {
    'video_id': videoId,
    'course_id': course['id'],
    'module_id': moduleId,
    'bookmarks': updatedBookmarks,
  };

  await SQLHelper.update(value, 'M${moduleId}C${course['id']}V$videoId');
}

Future<String> fetchBookmarks(Map course, int moduleId, int videoId) async {
  final data = await SQLHelper.getItem([course['id'], moduleId, videoId],
      'course_id = ? AND module_id = ? AND video_id = ?');
  String bookmarks = '';

  if (data != null && (data.length) > 0) {
    bookmarks = data[0]['bookmarks'];
  } else {
    await SQLHelper.createItem('M${moduleId}C${course['id']}V$videoId', videoId,
        course['id'], moduleId, 0, bookmarks);
  }

  return bookmarks;
}
