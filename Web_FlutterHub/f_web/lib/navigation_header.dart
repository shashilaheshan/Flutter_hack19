import 'package:f_web/providers/get_post_api.dart';
import 'package:f_web/response_widget.dart';
import 'package:flutter_web/material.dart';

import 'pages/single_post.dart';

class NavHeader extends StatelessWidget {
  //ContactApiProvider obj = ContactApiProvider();

  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PKDot(),
//          Spacer(),
          if (!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: <Widget>[
                NavButton(
                  text: "About",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SinglePost()),
                    );
                  },
                ),
                NavButton(
                  text: "Tutorials",
                  onPressed: () {},
                ),
                NavButton(
                  text: "Questions",
                  onPressed: () {},
                ),
                NavButton(
                  text: "Jobs",
                  onPressed: () {
                    //obj.getPosts();
                  },
                ),
              ],
            )
        ],
      ),
    );
  }
}

class PKDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "Flutter H U B",
          textScaleFactor: 2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(
        color: color,
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class ProfileInfo extends StatelessWidget {
  profileImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.deepOrange,
//            borderRadius: BorderRadius.circular(40),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
                "https://hassansaleh.ams3.cdn.digitaloceanspaces.com/flutter-state-management/flutter-state-management.jpeg"),
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Flutter Bloc Pattern",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange),
      ),
      Text(
        "Author -Shashila Heshan",
        textScaleFactor: 3,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "A Google Developer Expert for Flutter, Dart & Web Tech.\n"
        "I am also a youtuber having Techzonelk youtube channel\n"
        "where I make tutorials for technology.",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Resume"),
            color: Colors.red,
            onPressed: () {},
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            shape: StadiumBorder(),
            child: Text("Say Hi!"),
            color: Colors.red,
            onPressed: () {},
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context), profileData],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData
        ],
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              NavButton(
                text: "Github",
                onPressed: () {},
                color: Colors.blue,
              ),
              NavButton(
                text: "Twitter",
                onPressed: () {},
                color: Colors.blue,
              ),
              NavButton(
                text: "Facebook",
                onPressed: () {},
                color: Colors.blue,
              ),
            ],
          ),
          Text(
            "Shashila HEshan ©️2019",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NavButton(
            text: "Github",
            onPressed: () {},
            color: Colors.blue,
          ),
          NavButton(
            text: "Twitter",
            onPressed: () {},
            color: Colors.blue,
          ),
          NavButton(
            text: "Facebook",
            onPressed: () {},
            color: Colors.blue,
          ),
          Text(
            "Shashila HEshan ©️2019",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
