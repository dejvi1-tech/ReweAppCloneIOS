import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'routes.dart';
import 'screens/splash_screen.dart';

class ReweApp extends ConsumerWidget {
  const ReweApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CupertinoApp(
      title: 'REWE',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemRed,
        brightness: Brightness.light,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.black,
        ),
      ),
      home: SplashScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}