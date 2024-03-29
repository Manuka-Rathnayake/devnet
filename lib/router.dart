import 'package:devnet2/features/authentication/screen/login_screen.dart';
import 'package:devnet2/features/community/screens/Community_screen.dart';
import 'package:devnet2/features/community/screens/Create_Community.dart';
import 'package:devnet2/features/home/screen/home_screen.dart';
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
});
