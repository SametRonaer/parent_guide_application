import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends StatefulWidget {
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
  final String videoId;
  VideoWidget(this.videoId);
}

class _VideoWidgetState extends State<VideoWidget> {
  bool videoPlay = false;

  @override
  Widget build(BuildContext context) {
    String thumbnailImage = YoutubePlayer.getThumbnail(videoId: widget.videoId);
    return videoPlay
        ? _getVideoPlayer(widget.videoId)
        : _getThumbnailImage(thumbnailImage);
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

  Widget _getVideoPlayer(String videoId) {
    return Container(
      width: double.infinity,
      height: 270,
      color: Colors.teal,
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoId, //Add videoID.
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
