import 'package:it_grow_test/Data/Database/SQLHelper.dart';

markVideoCompleted(Map course, int videoId, int moduleId) async {
  final data = await SQLHelper.getItem([course['id'], moduleId, videoId],
      'course_id = ? AND module_id = ? AND video_id = ?');

  if (data.length < 1) {
    await SQLHelper.createItem('M${moduleId}C${course['id']}V$videoId', videoId,
        course['id'], moduleId, 0, '');
  }

  Map<String, dynamic> value = {
    'video_id': videoId,
    'course_id': course['id'],
    'module_id': moduleId,
    'watched': 1
  };

  await SQLHelper.update(value, 'M${moduleId}C${course['id']}V$videoId');
  return true;
}

Future<Map> isVideoCompleted(Map course) async{
  final data = await SQLHelper.getItem([course['id']], 'course_id = ?');

  Map result = {};
  if(data !=[]){
    for(int i=0; i<data.length; i++){
      result[data[i]['id']] = data[i]['watched'];
    }
  }
  return result;
}

isCourseCompleted(Map course) async {
  bool isCompleted = true;
  final data = await SQLHelper.getItem([course['id']], 'course_id = ?');

  if (data.length < course['totalVideo']) {
    isCompleted = false;
  } else {
    for (int i = 0; i < data.length; i++) {
      if (data[i]['watched'] == 0) {
        isCompleted = false;
        break; //if any data contains watched is 0 then no need to check other values.
      }
    }
  }

  return isCompleted;
}
