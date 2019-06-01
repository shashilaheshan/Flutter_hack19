import 'package:flutter_web/material.dart';

import '../navigation_header.dart';
import '../response_widget.dart';


class SinglePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: <Widget>[
                    NavButton(text: "About",onPressed: (){},),
                    NavButton(text: "Work",onPressed: (){},),
                    NavButton(text: "Portfolio",onPressed: (){},),
                  ],
                ),
              )
            : null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                children: <Widget>[
                  NavHeader(),
                  
                  // ProfileInfo(),
                  // SocialInfo()

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
