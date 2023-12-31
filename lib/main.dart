import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_news_app/feature/home_screen/presentation/provider/firebase_latest_mobile_data_provider.dart';
import 'package:mobile_news_app/feature/home_screen/presentation/provider/mobile_brands_provider.dart';
import 'package:mobile_news_app/feature/mobile_brands/presentation/pages/mobile_brand_page.dart';
import 'package:mobile_news_app/feature/mobile_brands/presentation/provider/selected_mobile_provider.dart';
import 'package:mobile_news_app/feature/mobile_detail_page/presentation/page/mobile_detail_page.dart';
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
        ChangeNotifierProvider(
          create: (context) => SelectedMobileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MobileBrandProvider(),
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
          MobileDetailScreen.routeName: (context) => const MobileDetailScreen(),
          MobileBrandPage.routeName: (context) => const MobileBrandPage(),
        },
      ),
    );
  }
}
