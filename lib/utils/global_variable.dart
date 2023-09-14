import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/screens/feed_Screen.dart';
import 'package:instagram_clone/screens/home_screen.dart';

final webScreenSize = 600;

const HomeScreenItem = [
  FeedScreen(),
  Text('search'),
  AddPostScreen(),
  Text('notif'),
  Text('profile'),
];
