import 'package:flutter/material.dart';
import 'package:flutter_bot/global/global.dart';
import 'package:flutter_bot/models/post_model.dart';

class SinglePostView extends StatefulWidget {
  final Post id;

  SinglePostView(this.id);

  @override
  _SinglePostViewState createState() => _SinglePostViewState();
}

class _SinglePostViewState extends State<SinglePostView> {
  final TextStyle desc_style = TextStyle(
      fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(col_singlepost),
      appBar: AppBar(
        backgroundColor: Color(col_singlepost),
        title: Text(widget.id.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),

                    /// This is the important part, we need [Hero] widget with unique tag but same as Hero's tag in [User] widget.
                    child: Hero(
                      tag: "avatar_" + widget.id.id.toString(),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(widget.id.image_url),
                      ),
                    ),
                  ),
                  Chip(
                    elevation: 30,
                    label: Text(widget.id.category),
                    backgroundColor: Colors.orange,
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            Text(
              "Description",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.id.description,
                style: desc_style,
                overflow: TextOverflow.fade,
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            Text(
              "Related Topics",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (_, int i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        elevation: 30,
                        label: Text(widget.id.category),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }),
            ),
            Text(
              "Comments",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (_, int i) {
                    return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(Icons.autorenew, color: Colors.white),
                        ),
                        title: Text(
                          "Introduction to Dart Lang",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" Intermediate",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 30.0));
                  }),
            ),

//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Chip(
//                  elevation: 30,
//                  label: Text(widget.id.category),
//                  backgroundColor: Colors.orange,
//                ),
//                Chip(
//                  elevation: 30,
//                  label: Text(widget.id.category),
//                  backgroundColor: Colors.orange,
//                ),
//                Chip(
//                  elevation: 30,
//                  label: Text(widget.id.category),
//                  backgroundColor: Colors.orange,
//                ),Chip(
//                  elevation: 30,
//                  label: Text(widget.id.category),
//                  backgroundColor: Colors.orange,
//                ),
//
//              ],
//            )


          ],
        ),
      ),
    );
  }
}
