import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:insideapp/providers/app_provider.dart';
import 'package:insideapp/providers/register_provider.dart';
import 'package:insideapp/screens/splash.dart';
import 'package:insideapp/util/const.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: ThemeData(fontFamily: 'Josef'),
          home: SplashScreen(),
        );
      },
    );
  }
}