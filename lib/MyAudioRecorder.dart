import 'package:audio_recorder/audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test123/Constants.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class RecordAudio {
  static String path;

  static void getStoragePath() async {
    path = (await getExternalStorageDirectory()).path + '/${Constants.appName}';



  }

  static void recordAudio() async {
    getStoragePath();

    if(await AudioRecorder.isRecording){
      stopRecording();
    }

    bool x = await AudioRecorder.hasPermissions;
    print("Permision $x");
    if (await AudioRecorder.hasPermissions) {
      String dateTime = DateTime.now().toString();

      await AudioRecorder.start(
          path: RecordAudio.path + dateTime, audioOutputFormat: AudioOutputFormat.AAC);

      print("Path is ${path+dateTime}");

/*      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
      var initializationSettingsAndroid = new AndroidInitializationSettings('app_icon');
      var initializationSettingsIOS = new IOSInitializationSettings();
      var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
      flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (_){RecordAudio.stopRecording();});
      var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
      var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
      var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item id 2');
      await flutterLocalNotificationsPlugin.show(
        0, 'Recording Audio', 'Tap to stop recording', platformChannelSpecifics,
        payload: 'item id 2');*/


      await Future.delayed(
        Duration(seconds: 8),
      );
      stopRecording();
    }
  }

  static void stopRecording() async {
    if (await AudioRecorder.isRecording) {

      print("Stopped");

      AudioRecorder.stop();
    }
  }
}
