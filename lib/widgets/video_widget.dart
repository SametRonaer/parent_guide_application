import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends StatefulWidget {
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  bool videoPlay = false;
  String thumbnailImage = YoutubePlayer.getThumbnail(videoId: "EzJPwC-MnyY");

  @override
  Widget build(BuildContext context) {
    return videoPlay ? _getVideoPlayer() : _getThumbnailImage(thumbnailImage);
  }

  Widget _getThumbnailImage(String imageUrl) {
    return GestureDetector(
      onTap: () {
        setState(() {
          videoPlay = true;
        });
      },
      child: Container(
        width: double.infinity,
        height: 270,
        color: Colors.teal,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
            ),
            Icon(
              Icons.play_arrow,
              size: 80,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getVideoPlayer() {
    return Container(
      width: double.infinity,
      height: 270,
      color: Colors.teal,
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: 'EzJPwC-MnyY', //Add videoID.
          flags: YoutubePlayerFlags(
            hideControls: false,
            controlsVisibleAtStart: true,
            autoPlay: true,
            mute: false,
          ),
        ),
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.green,
      ),
    );
  }
}
