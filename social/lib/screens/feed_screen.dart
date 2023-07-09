import 'package:flutter/material.dart';
import 'package:social/widgets/post_card.dart';

import '../utils/custom_text.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: CustomText(shadow: [
          Shadow(
            blurRadius: 80,
            color: Colors.blue,
          )
        ], text: 'SOCIAL', fontSize: 20),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.messenger_outline))
        ],
      ),
      body: const PostCard(),
    );
  }
}
