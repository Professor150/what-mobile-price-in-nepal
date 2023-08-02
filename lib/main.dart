import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_news_app/feature/home_screen/data/firebase_latest_mobile_data.dart';
import 'package:mobile_news_app/feature/mobile_detail_page/presentation/page/detail_page.dart';
import 'package:mobile_news_app/feature/home_screen/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LatestMobilePorivder(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Colors.deepOrange,
          ),
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          DetailScreen.routeName: (context) => const DetailScreen(),
        },
      ),
    );
  }
}
