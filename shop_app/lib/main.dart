import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Api/firebaseApi.dart';
import 'package:shop_app/Providers/auth.dart';
import 'package:shop_app/Providers/cart.dart';
import 'package:shop_app/Providers/products.dart';
import 'package:shop_app/Screens/firstPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'Screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///dependency injections injecting providers into my app
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => cart()),
        ChangeNotifierProvider(create: (_) => Auth())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
