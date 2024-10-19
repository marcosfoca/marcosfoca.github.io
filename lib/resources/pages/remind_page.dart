import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';  // Import video_player package
import '../colors.dart';
import '../widgets/app_drawer.dart';
import 'dart:html' as html;

class RemindPage extends StatefulWidget {
  const RemindPage({super.key});

  @override
  State<RemindPage> createState() => _RemindPageState();
}

class _RemindPageState extends State<RemindPage> {
  String appDownloadLink = "https://play.google.com/store/apps/details?id=com.theneymarofsoftware.remind";
  String iconRoute = "lib/resources/assets/remind_icon.png";
  String appDescription =
      "Upgrade yourself while feeling like playing a video-game. ReMind implements a bunch of tools to easily add new Habits into your routine with the help of AI, so that you can sit, enjoy and improve.";

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video controller
    _controller = VideoPlayerController.asset('lib/resources/assets/movilVideo.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown before the video starts
        setState(() {});
        _controller.play();  // Autoplay the video
        _controller.setPlaybackSpeed(0.4);
        _controller.setLooping(false);  // Don't loop the video

        // Stay on the last frame when the video finishes
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            _controller.pause();  // Pause at the last frame
          }
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _seeMore() async {
    html.AnchorElement anchor = html.AnchorElement(href: appDownloadLink);
    anchor.click();
  }

  Widget mainButton(String text) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(remindDefaultBlack),
        foregroundColor: MaterialStateProperty.all<Color>(remindDefaultWhite),
      ),
      onPressed: () async {
        await _seeMore();
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.launch_outlined, color: remindDefaultWhite, size: 30),
            const SizedBox(width: 13),
            FittedBox(
              child: Text(
                text,
                style: TextStyle(fontSize: 30, fontFamily: 'BebasNeue', color: remindDefaultWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget presentationBlock() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: SizedBox(
              height: 600,
              width: 330,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),  // Match with border radius
                child: Center(
                  // Display video player
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                      : const CircularProgressIndicator(color: remindDefaultBlack),  // Show a loader until the video initializes
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text and description
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Add habits to your routine',
                        style: TextStyle(
                          fontFamily: 'LTHoop',
                          fontWeight: FontWeight.w900,
                          color: remindDefaultBlack,
                          fontSize: 60,
                        ),
                      ),
                      TextSpan(
                        text: '',
                        style: TextStyle(
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.w900,
                          color: remindDefaultBlack,
                          fontSize: 60,
                        ),
                      ),
                      TextSpan(
                        text: ' without even noticing',
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontWeight: FontWeight.w900,
                          color: remindDefaultBlack,
                          fontSize: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                const Text(
                  "ReMind: new generation of habit-tracking",
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    color: remindDefaultBlack,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  appDescription,
                  style: TextStyle(
                    color: remindDefaultBlack,
                    fontFamily: 'LTHoop',
                    fontSize: 21,
                  ),
                ),
                const SizedBox(height: 50),
                mainButton("see more"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget feature(IconData? icon, String title, String description) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: remindDefaultBlack,
                size: 60, // Adjust icon size to match text better
              ),
              const SizedBox(width: 12), // Add spacing between icon and text
              FittedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'LTHoop', // Set custom font
                    fontSize: 56, // Larger font for "track" (title-like)
                    color: remindDefaultBlack,
                    fontWeight: FontWeight.bold, // Make it bolder for title look
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Add spacing between title and description
          SizedBox(
            width: 500,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'LTHoop', // Set custom font
                fontSize: 24, // Smaller size for description
                color: remindDefaultBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget featuresBlock() {
    return
        Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 70, // Adds some spacing between the feature cards
          runSpacing: 60, // Adds vertical spacing between rows
          children: [
            feature(
                Icons.smart_toy_rounded, // Icon related to AI and automation
                "AI-Powered Setup",
                "Easily add new activities with AI assistance—just name it, and we'll handle the rest! No need for manual setup, focus on getting things done."
            ),
            feature(
                Icons.leaderboard_rounded, // Icon representing scores and progress
                "Score-Based Goals",
                "Stay on top of your game with daily performance scores. Every day, get insights on how well you're doing across all activities."
            ),
            feature(
                Icons.fitness_center_rounded, // Icon representing fitness and strength (Progressive Overload)
                "Adaptive Progression",
                "Our system dynamically adjusts your goals based on your progress. Challenge yourself with personalized goals that grow with you."
            ),
            feature(
                Icons.show_chart_rounded, // Icon representing tracking and progress
                "Track Your Growth",
                "Monitor your performance over time with detailed progress tracking. See how far you've come and celebrate your achievements."
            ),
          ],
        );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: remindDefaultWhite,
      appBar: AppBar(
        foregroundColor: remindDefaultWhite,
        backgroundColor: remindDefaultBlack,
        title: Center(child: Text("ReMind", style: TextStyle(fontSize: 30, fontFamily: 'Lobster'))),
      ),
      drawer: AppDrawer(color1: remindDefaultBlack, color2: remindDefaultWhite),
      body: ListView(
        shrinkWrap: true,
        children: [
          presentationBlock(),
          const SizedBox(height: 170),
          featuresBlock(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: mainButton("Check it out"),
          ),
          const SizedBox(height: 170),
        ],
      ),
    );
  }
}