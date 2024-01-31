import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PagarPage extends StatefulWidget {
  const PagarPage({super.key});

  @override
  State<PagarPage> createState() => _PagarPageState();
}

class _PagarPageState extends State<PagarPage> {
  late VideoPlayerController _videoCtrl;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoCtrl = VideoPlayerController.asset('assets/juego_miedo.mp4');
    _initializeVideoPlayerFuture = _videoCtrl.initialize();
    _videoCtrl.play();
    // Future.delayed(const Duration(seconds: 18), () {
    //   SystemNavigator.pop();
    // });
    super.initState();
  }

  @override
  void dispose() {
    _videoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _videoCtrl.value.aspectRatio,
                  child: VideoPlayer(_videoCtrl),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/tarjeta.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // if (_videoCtrl.value.isPlaying) {
            _videoCtrl.pause();
            Navigator.pop(context);

            // }
          });
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.exit_to_app_rounded, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
