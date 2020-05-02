import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nice_intro/intro_screen.dart';
import 'package:nice_intro/intro_screens.dart';
import 'package:tinycolor/tinycolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'intro screen demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var screens = IntroScreens(
      onDone: () => print('End of slides'),
      onSkip: () => print('Skipping the intro slides'),
      footerBgColor: TinyColor.fromString("#cc1641").lighten().color,
      activeDotColor: Colors.white,
      footerRadius: 18.0,
//      indicatorType: IndicatorType.CIRCLE,
      slides: [
        IntroScreen(
          title: 'Search',
          mChild: CachedNetworkImage(
              imageUrl: "https://www.moodynfoody.com/wp-content/uploads/2019/08/food-3.jpg",
              fit: BoxFit.contain
          ),
          description: 'Quickly find all your messages',
          headerBgColor: Colors.white,
        ),
        IntroScreen(
          title: 'Focused Inbox',
          headerBgColor: Colors.white,
          mChild: CachedNetworkImage(
              imageUrl: "https://www.thenpclinic.com/wp-content/uploads/2019/10/food-addiction-2.jpg",
              fit: BoxFit.contain
          ),
          description: "We've put your most important, actionable emails here",
        ),
        IntroScreen(
          title: 'Social',
          headerBgColor: Colors.white,
          mChild: CachedNetworkImage(
              imageUrl: "https://foodofcultures.nl/wp-content/uploads/2019/10/whatsapp-image-2019-10-03-at-19.42.44-1-e1571178781491.jpeg",
              fit: BoxFit.contain
          ),
          description: "Keep talking with your mates",
        ),
      ],
    );

    return Scaffold(
      body: screens,
    );
  }
}
