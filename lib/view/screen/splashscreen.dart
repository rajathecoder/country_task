import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'homescreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  VideoPlayerController? _noInternetController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/country_gif.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });

    _checkInternetConnectivity();
  }

  Future<void> _checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection, show a dialog
      _showNoInternetDialog();
    } else {
      // Internet is available, start the timer
      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    }
  }

  void _showNoInternetDialog() {
    _noInternetController = VideoPlayerController.asset('assets/video/no internet.mp4')
      ..initialize().then((_) {
        _noInternetController!.play();
        _noInternetController!.setLooping(true);
        setState(() {});
      });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "No Internet Connection",
            style: TextStyle(fontSize: 15),
          ),
          content: _noInternetController != null && _noInternetController!.value.isInitialized
              ? AspectRatio(
            aspectRatio: _noInternetController!.value.aspectRatio,
            child: VideoPlayer(_noInternetController!),
          )
              : CircularProgressIndicator(), // Show a loading indicator while the video is loading
          actions: [
            TextButton(
              child: Text("Retry"),
              onPressed: () {
                Navigator.of(context).pop();
                _noInternetController?.dispose(); // Dispose of the video controller
                _checkInternetConnectivity();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _noInternetController?.dispose(); // Dispose of the no internet video controller if used
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}
