import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_indvidual/core/general_account_sql.dart';
import 'package:movie_app_indvidual/core/general_screens/onboarding_screen.dart';
import 'package:movie_app_indvidual/features/bookmark/data/repo/sql_provider.dart';
import 'package:movie_app_indvidual/features/home/presentation/manager/home_provider.dart';
import 'package:movie_app_indvidual/features/home/presentation/manager/movies_provider.dart';
import 'package:movie_app_indvidual/features/movie_details/presentation/manager/movie_details_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'features/bookmark/presentation/manager/bookmark_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SQLProvider.instance.open();
  await AccountProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookmarkProvider(),),
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => MoviesProvider(),),
        ChangeNotifierProvider(create: (context) => MovieDetailsProvider(),),
      ],
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Provider.of<HomeProvider>(context).themData,
              home: AnimatedSplashScreen(
                duration: 3000,
                splash: "assets/result.png",
                splashIconSize: 150,
                nextScreen: const OnBoardingScreen(),
                splashTransition: SplashTransition.sizeTransition,
                pageTransitionType: PageTransitionType.leftToRight,
                backgroundColor:Colors.black87,
              ));
        },
      ),
    );
    //   HomeScreen(),
    // );
  }
}
