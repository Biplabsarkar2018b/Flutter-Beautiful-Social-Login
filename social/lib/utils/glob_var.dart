import 'package:flutter/material.dart';
import 'package:social/screens/add_post.dart';
import 'package:social/screens/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  Center(child: Text('search')),
  AddPostScreen(),
  Center(child: Text('favorite')),
  Center(child: Text('profile')),
];
