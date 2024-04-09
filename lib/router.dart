import 'package:devnet2/features/authentication/screen/login_screen.dart';
import 'package:devnet2/features/community/screens/Community_screen.dart';
import 'package:devnet2/features/community/screens/Create_Community.dart';
import 'package:devnet2/features/community/screens/Community_Settings_screen.dart';
import 'package:devnet2/features/community/screens/Edit_community_screen.dart';
import 'package:devnet2/features/home/screen/home_screen.dart';
import 'package:devnet2/features/posts/screens/add_post_type_screen.dart';
import 'package:devnet2/features/posts/screens/comments_screen.dart';
import 'package:devnet2/features/posts/screens/new_post_screen.dart';
import 'package:devnet2/features/user%20profile/screens/edit_profile_screen.dart';
import 'package:devnet2/features/user%20profile/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  "/": (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  "/": (_) => const MaterialPage(child: HomeScreen()),
  "/create-community": (_) =>
      const MaterialPage(child: CreateCommunityScreen()),
  "/:name": (route) => MaterialPage(
          child: CommunityScreen(
        name: route.pathParameters['name']!,
      )),
  "/settings/:name": (routeData) => MaterialPage(
        child: CommunitySettingsScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  "/edit-community/:name": (routeData) => MaterialPage(
        child: EditCommunityScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  "/user/:uid": (routeData) => MaterialPage(
        child: UserProfileScreen(
          uid: routeData.pathParameters['uid']!,
        ),
      ),
  "/edit-profile/:uid": (routeData) => MaterialPage(
        child: EditProfileScreen(
          uid: routeData.pathParameters['uid']!,
        ),
      ),
  "/add-post/:type": (routeData) => MaterialPage(
        child: AddPostTypeScreen(
          type: routeData.pathParameters['type']!,
        ),
      ),
  "/post/:postId/comments": (route) => MaterialPage(
        child: CommentsScreen(
          postId: route.pathParameters['postId']!,
        ),
      ),
});
