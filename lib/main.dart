import 'package:flutter/material.dart';
import 'package:marcos_portfolio/resources/pages/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:marcos_portfolio/resources/pages/remind_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/remind',
        builder: (context, state) => RemindPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(child: Text('Page not found')),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router, // En lugar de usar routerDelegate y routeInformationParser por separado
      debugShowCheckedModeBanner: false,
      title: "by TheNeymarOfSoftware",
    );
  }
}
