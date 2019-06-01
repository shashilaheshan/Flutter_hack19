import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bot/blocs/check_connectivity.dart';
import 'package:flutter_bot/blocs/post_bloc.dart';
import 'package:flutter_bot/global/global.dart';
import 'package:flutter_bot/models/single_post_model.dart';
import 'package:flutter_bot/screens/add_post/add_post.dart';
import 'package:flutter_bot/screens/single_post/single_post.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';

class dashBoardView extends StatefulWidget {
  @override
  _dashBoardViewState createState() => _dashBoardViewState();
}

class _dashBoardViewState extends State<dashBoardView>
    with AfterLayoutMixin<dashBoardView> {
  Color cl = Color(0XFF3C2F79);
  var rating = 0.0;
  Color textColor = Colors.white;
  PostBloc bloc = PostBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    final postbloc = Provider.of<PostBloc>(context);

    final bloc = Provider.of<ConnectivityService>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              postbloc.getPosts();
            },
            icon: Icon(Icons.refresh),
          )
        ],
        backgroundColor: cl,
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: textColor,
            fontFamily: 'Ubuntu-Bold',
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 30,
        child: Container(
          color: cl,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: cl),
                  accountName: Text(
                    "Welcome Shashila Heshan",
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text(
                    "4.9*",
                    style: TextStyle(color: Colors.white),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 10,
                    backgroundColor:
                        Theme.of(context).platform == TargetPlatform.iOS
                            ? Colors.transparent
                            : Colors.transparent,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.network(
                            "https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/c0.44.480.480a/p480x480/44106586_1817336448383979_7168327088770908160_o.jpg?_nc_cat=101&_nc_ht=scontent-sjc3-1.xx&oh=5a3f3e712ff8f5beb4b57fdc8e872b4a&oe=5D6B0861")),
                  )),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.userEdit,
                  color: textColor,
                ),
                title: Text(
                  "My Profile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/myspa');
                },
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.firstOrder,
                  color: textColor,
                ),
                title: Text(
                  "My Courses",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/step');
                },
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.book,
                  color: textColor,
                ),
                title: Text(
                  "Add Posts",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.facebookMessenger,
                  color: textColor,
                ),
                title: Text(
                  "Inbox  (20)",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.solidThumbsUp,
                  color: textColor,
                ),
                title: Text(
                  "Channels",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: textColor,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.white,
              ),
//              ListTile(
//                leading: Icon(
//                  FontAwesomeIcons.signOutAlt,
//                  color: textColor,
//                ),
//                title: Text(
//                  "Logout",
//                  style: TextStyle(
//                    color: Colors.white,
//                  ),
//                ),
//                onTap: () {},
//              ),
            ],
          ),
        ),
      ),
      body: bloc.ConnectionResult
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: width,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Welcome again..",
                              style: TextStyle(
                                  fontFamily: 'Ubuntu-Bold', fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Stories in Flutter  H U B",
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu-Bold', fontSize: 18),
                                ),
                                Chip(
                                  elevation: 30,
                                  label: Text(
                                    "More",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Ubuntu-Bold'),
                                  ),
                                  backgroundColor: Colors.orange,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width,
                              height: height,
                              child: postbloc.allPosts.length != 0
                                  ? ListView.builder(
                                      itemCount: postbloc.allPosts.length,
                                      itemBuilder: (_, int i) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SinglePostView(postbloc
                                                          .allPosts[i])),
                                            );
                                          },
                                          child: Hero(
                                            tag: 'avatar_' +
                                                postbloc.allPosts[i].id
                                                    .toString(),
                                            child: Card(
                                              elevation: 20,
                                              child: Container(
                                                height: 120,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              300),
                                                      child: Image.network(
                                                        postbloc.allPosts[i]
                                                            .image_url,
                                                        width: 79,
                                                        height: 79,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            postbloc.allPosts[i]
                                                                .category,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Ubuntu-Bold'),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(postbloc
                                                              .allPosts[i]
                                                              .time),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                  : SizedBox(
                                      width: 10,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))
          : Image.asset('/images/caveman_6.gif'),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout

    final postbloc = Provider.of<PostBloc>(context);
    postbloc.getPosts();
  }
}

//void settingModalBottomSheet(context, String date) {
//  showModalBottomSheet(
//      context: context,
//      builder: (BuildContext bc) {
//        return SingleChildScrollView(
//          child: Container(
//            child: new Wrap(
//              children: <Widget>[
//                Center(
//                    child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text(
//                    date,
//                    style: TextStyle(fontFamily: 'Ubuntu-Bold', fontSize: 20),
//                  ),
//                )),
//                Column(
//                  children: <Widget>[
//                    Card(
//                      elevation: 20,
//                      child: Container(
//                        height: 120,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            ClipRRect(
//                              borderRadius: BorderRadius.circular(300),
//                              child: Image.network(
//                                "https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/c0.44.480.480a/p480x480/44106586_1817336448383979_7168327088770908160_o.jpg?_nc_cat=101&_nc_ht=scontent-sjc3-1.xx&oh=5a3f3e712ff8f5beb4b57fdc8e872b4a&oe=5D6B0861",
//                                width: 79,
//                                height: 79,
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(20.0),
//                              child: Column(
//                                children: <Widget>[
//                                  Text(
//                                    "Shashila Heshan",
//                                    style: TextStyle(fontFamily: 'Ubuntu-Bold'),
//                                  ),
//                                  Text("Body massage"),
//                                  SizedBox(
//                                    height: 10,
//                                  ),
//                                  Text("10:45AM")
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    ),
//                    Card(
//                      elevation: 20,
//                      child: Container(
//                        height: 120,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            ClipRRect(
//                              borderRadius: BorderRadius.circular(300),
//                              child: Image.network(
//                                "https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/c0.44.480.480a/p480x480/44106586_1817336448383979_7168327088770908160_o.jpg?_nc_cat=101&_nc_ht=scontent-sjc3-1.xx&oh=5a3f3e712ff8f5beb4b57fdc8e872b4a&oe=5D6B0861",
//                                width: 79,
//                                height: 79,
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(20.0),
//                              child: Column(
//                                children: <Widget>[
//                                  Text(
//                                    "Shashila Heshan",
//                                    style: TextStyle(fontFamily: 'Ubuntu-Bold'),
//                                  ),
//                                  Text("Body massage"),
//                                  SizedBox(
//                                    height: 10,
//                                  ),
//                                  Text("10:45AM")
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    ),
//                    Card(
//                      elevation: 20,
//                      child: Container(
//                        height: 120,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            ClipRRect(
//                              borderRadius: BorderRadius.circular(300),
//                              child: Image.network(
//                                "https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/c0.44.480.480a/p480x480/44106586_1817336448383979_7168327088770908160_o.jpg?_nc_cat=101&_nc_ht=scontent-sjc3-1.xx&oh=5a3f3e712ff8f5beb4b57fdc8e872b4a&oe=5D6B0861",
//                                width: 79,
//                                height: 79,
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(20.0),
//                              child: Column(
//                                children: <Widget>[
//                                  Text(
//                                    "Shashila Heshan",
//                                    style: TextStyle(fontFamily: 'Ubuntu-Bold'),
//                                  ),
//
//                                  SizedBox(
//                                    height: 10,
//                                  ),
//                                  Text("10:45AM")
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    ),
//                    Card(
//                      elevation: 20,
//                      child: Container(
//                        height: 120,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            ClipRRect(
//                              borderRadius: BorderRadius.circular(300),
//                              child: Image.network(
//                                "https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/c0.44.480.480a/p480x480/44106586_1817336448383979_7168327088770908160_o.jpg?_nc_cat=101&_nc_ht=scontent-sjc3-1.xx&oh=5a3f3e712ff8f5beb4b57fdc8e872b4a&oe=5D6B0861",
//                                width: 79,
//                                height: 79,
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(20.0),
//                              child: Column(
//                                children: <Widget>[
//                                  Text(
//                                    "Shashila Heshan",
//                                    style: TextStyle(fontFamily: 'Ubuntu-Bold'),
//                                  ),
//
//                                  SizedBox(
//                                    height: 10,
//                                  ),
//                                  Text("10:45AM")
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    ),
//                    Card(
//                      elevation: 20,
//                      child: Container(
//                        height: 120,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            ClipRRect(
//                              borderRadius: BorderRadius.circular(300),
//                              child: Image.network(
//                                "https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/c0.44.480.480a/p480x480/44106586_1817336448383979_7168327088770908160_o.jpg?_nc_cat=101&_nc_ht=scontent-sjc3-1.xx&oh=5a3f3e712ff8f5beb4b57fdc8e872b4a&oe=5D6B0861",
//                                width: 79,
//                                height: 79,
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(20.0),
//                              child: Column(
//                                children: <Widget>[
//                                  Text(
//                                    "Shashila Heshan",
//                                    style: TextStyle(fontFamily: 'Ubuntu-Bold'),
//                                  ),
//                                  Text("Body massage"),
//                                  SizedBox(
//                                    height: 10,
//                                  ),
//                                  Text("10:45AM")
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ],
//            ),
//          ),
//        );
//      });
//}
