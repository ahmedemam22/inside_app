import 'package:flutter/material.dart';
import 'package:insideapp/providers/login_provider.dart';
import 'package:insideapp/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:insideapp/providers/app_provider.dart';
import 'package:insideapp/providers/register_provider.dart';
import 'package:insideapp/providers/supplier_provider.dart';
import 'package:insideapp/screens/splash.dart';
import 'package:insideapp/screens/supplier_home.dart';
import 'package:insideapp/util/const.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SupplierProvider()),

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
            initialRoute:'/splash',
            routes: <String, WidgetBuilder>{
              '/splash': (BuildContext context) => SplashScreen(),
              '/home': (BuildContext context) => Home(),
              '/supplier_home': (BuildContext context) => SupplierHome(),
              //'/splash': (BuildContext context) => SplashScreen(),



            }
        );
      },
    );
  }
}