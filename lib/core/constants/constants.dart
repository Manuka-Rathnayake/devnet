import 'package:devnet2/features/feed/screens/feed_screen.dart';
import 'package:devnet2/features/home/screen/home_screen.dart';
import 'package:devnet2/features/posts/screens/add_post_type_screen.dart';
import 'package:devnet2/features/posts/screens/new_post_screen.dart';
import 'package:flutter/material.dart';

class Constants {
  static const logoPath = 'assets/images/logo.png';
  static const loginEmotePath = 'assets/images/loginEmote.png';
  static const googleLogoPath = 'assets/images/google.png';

  static const bannerDefault =
      'https://thumbs.dreamstime.com/z/black-keyboard-13467928.jpg?ct=jpeg';
  static const avatarDefault =
      'https://thumbs.dreamstime.com/z/group-sign-25931975.jpg?ct=jpeg';

  static const tabWidgets = [FeedScreen(), AddPostScreen()];

  static const IconData up =
      IconData(0xe800, fontFamily: 'MyFlutterApp', fontPackage: null);
  static const IconData down =
      IconData(0xe801, fontFamily: 'MyFlutterApp', fontPackage: null);

}
