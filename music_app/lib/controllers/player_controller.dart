import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();
  var hasPermission = false.obs;
  var playIndex = 0.obs;
  var isPlaying = false.obs;
  var duration = "".obs;
  var position = "".obs;
  var max = 0.0.obs;
  var value = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    checkPermission();
  }

  updatePosition() {
    audioPlayer.durationStream.listen((d) {
      duration.value = d.toString().split(".")[0];
      max.value = d!.inSeconds.toDouble();
    });
    audioPlayer.positionStream.listen((p) {
      position.value = p.toString().split(".")[0];
      value.value = p.inSeconds.toDouble();
    });
  }

  changeDurationToSeconds(seconds) {
    var duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }

  playSong(String? uri, index) {
    playIndex.value = index;
    try {
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      audioPlayer.play();
      isPlaying.value = true;
      updatePosition();
    } on Exception catch (error) {
      print(error.toString());
    }
  }

  checkPermission() async {
    if (!kIsWeb) {
      bool permissionStatus = await audioQuery.permissionsStatus();
      if (!permissionStatus) {
        permissionStatus = await audioQuery.permissionsRequest();
      }
      hasPermission.value = permissionStatus;
    }
  }
}
