import 'package:flutter/material.dart';
import 'package:flutter_bot/blocs/check_connectivity.dart';
import 'package:flutter_bot/blocs/login_validator_bloc.dart';
import 'package:flutter_bot/blocs/post_bloc.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import 'home/home_view.dart';
import 'login/login_view.dart';


import 'package:provider/provider.dart';



class hack19_flutterBot extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

    providers: [

      ChangeNotifierProvider<LoginValidator>.value(notifier: LoginValidator()),

    ChangeNotifierProvider<ConnectivityService>.value(
    notifier: ConnectivityService()),
    ChangeNotifierProvider<PostBloc>.value(notifier: PostBloc()),


    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Getstarter(),
      ),
    );
  }
}

class Getstarter extends StatefulWidget {
  final String title;

  Getstarter({this.title});

  @override
  GetstarterState createState() {
    return new GetstarterState();
  }
}

class GetstarterState extends State<Getstarter> {
  int _slideIndex = 0;

  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  final List<String> images = [
    "images/slide_1.png",
    "images/slide_2.png",
    "images/slide_3.png",
    "images/slide_4.png"
  ];

  List<Color> colors = [Colors.orange];

  final List<String> text0 = [
    "Welcome in Flutter HUB",
    "Enjoy Flutter...",
    "Showcase your skills",
    "Grow Commiunity"
  ];

  final List<String> text1 = [
    "App for flutter beginners",
    "Find best tutorials in your area, simply",
    "Have fun while chatting your relatives and more",
    "Meet new jobs from all over the world"
  ];

  final IndexController controller = IndexController();
  @override
  Widget build(BuildContext context) {
    TransformerPageView transformerPageView = TransformerPageView(
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            this._slideIndex = index;
          });
          print(_slideIndex);
          switch (index) {
            case 2:
              {
                print('Last slide :$index');

                // AppInfo.disableWelcomePage();

                // return Timer(Duration(seconds: 3),
                //     () => Navigator.pushNamed(context, '/'));
              }
          }
        },
        loop: false,
        controller: controller,
        transformer: new PageTransformerBuilder(
            builder: (Widget child, TransformInfo info) {
          return new Material(
            color: Colors.white,
            elevation: 8.0,
            textStyle: new TextStyle(color: Colors.white),
            borderRadius: new BorderRadius.circular(12.0),
            child: new Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new ParallaxContainer(
                      child: new Text(
                        text0[info.index],
                        style: new TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 34.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                      position: info.position,
                      opacityFactor: .8,
                      translationFactor: 400.0,
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    new ParallaxContainer(
                      child: new Image.asset(
                        images[info.index],
                        fit: BoxFit.contain,
                        height: 350,
                      ),
                      position: info.position,
                      translationFactor: 400.0,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    new ParallaxContainer(
                      child: new Text(
                        text1[info.index],
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 28.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                      position: info.position,
                      translationFactor: 300.0,
                    ),
                    _slideIndex == 3
                        ? RaisedButton(

                      child: Icon(Icons.arrow_forward),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => dashBoardView()),
                              );
                            },
                          )
                        : SizedBox(
                            height: 1,
                          ),
                    SizedBox(
                      height: 55.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        itemCount: 4);

    return Scaffold(
      backgroundColor: Colors.white,
      body: transformerPageView,
    );
  }
}
