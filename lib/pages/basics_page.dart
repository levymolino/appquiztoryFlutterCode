import 'package:appquiztory/services/network_video_player.dart';
import 'package:appquiztory/tabbar_widget.dart';
import 'package:flutter/material.dart';

class BasicsPage extends StatelessWidget {
  const BasicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => TabBarWidget(
        tabs: const [
          Tab(icon: Icon(Icons.file_copy), text: 'Asset'),
          Tab(icon: Icon(Icons.attach_file), text: 'File'),
          Tab(icon: Icon(Icons.ondemand_video_outlined), text: 'Network'),
        ],
        onTap: (int value) {  },
        children: [

          buildNetwork(),
        ],
      );


  Widget buildNetwork() => const NetworkPlayerWidget();
}
