import 'package:appquiztory/floating_action_button_widget.dart';
import 'package:appquiztory/services/video_player_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';


class NetworkPlayerWidget extends StatefulWidget {
  const NetworkPlayerWidget({Key? key}) : super(key: key);

  @override
  _NetworkPlayerWidgetState createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  final textController = TextEditingController();
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();



    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("content").get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            String videoUrl = doc["Content Video"];
    
    controller = VideoPlayerController.network(videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  })});}

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            VideoPlayerWidget(controller: controller),
            buildTextField(),
          ],
        ),
      );

  Widget buildTextField() => Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            const SizedBox(width: 12),
            FloatingActionButtonWidget(
              onPressed: () {
                if (textController.text.trim().isEmpty) return;
              },
            ),
          ],
        ),
      );
}
