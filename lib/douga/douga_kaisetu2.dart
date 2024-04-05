import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DougaKaisetu2 extends StatefulWidget {
  const DougaKaisetu2({super.key});

  @override
  State<DougaKaisetu2> createState() => _DougaKaisetu2State();
}

class _DougaKaisetu2State extends State<DougaKaisetu2> {
  late YoutubePlayerController _controller;
  bool playSwitch = true;

  @override
  void initState() {
    super.initState();
    // YouTube 動画の URL から動画 ID を取得します
    String videoId = YoutubePlayer.convertUrlToId('C2Myd-nkzcw') ?? '';
    // YoutubePlayerController を初期化します
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    // 動画の再生状態を監視するリスナーを追加します
    _controller.addListener(() {
      if (_controller.value.playerState == PlayerState.ended) {
        // 動画が終了したら元のページに戻ります
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_controller.value.isPlaying) {
          _controller.pause();
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            title: const Text(
              'アプリの使い方',
              style: TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              progressColors: const ProgressBarColors(
                playedColor: Colors.blue,
                handleColor: Colors.blueAccent,
              ),
            ),
          ),
        ),
        persistentFooterButtons: <Widget>[
          SizedBox(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // 動画を一時停止
                    _controller.pause();
                    setState(() {
                      playSwitch = !playSwitch;
                    });
                  },
                  icon: const Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () {
                    // 動画を再生
                    _controller.play();
                    setState(() {
                      playSwitch = !playSwitch;
                    });
                  },
                  icon: const Icon(Icons.play_arrow),
                ),
                IconButton(
                  onPressed: () {
                    // 動画を最初から再生
                    _controller.pause();
                    playSwitch = !playSwitch;
                    setState(() {});
                    //despose();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.stop),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}