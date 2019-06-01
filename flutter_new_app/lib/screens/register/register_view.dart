import 'package:flutter/material.dart';
import 'package:flutter_bot/api_providers/register_api.dart';
import 'package:flutter_bot/screens/login/login_view.dart';


class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  registerApi obj=registerApi();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "REGISTER",
          style: TextStyle(
              fontSize: 27,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu-Bold'),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            child: Image.network(
              "https://www.hotelenglishpoint.com/images/ansui-spa-img5.png",
              width: width,
              height: height,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: SingleChildScrollView(
                child: Login_container(width / 1.1, height / 1.25, context)),
          )
        ],
      ),
    );
  }
}

Widget Login_container(double width, double height, BuildContext ctext) {
  TextEditingController ct = TextEditingController();

  TextEditingController ct3 = TextEditingController();
  TextEditingController ct4 = TextEditingController();
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.black54),
    height: height,
    width: width,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("Flutter H U B",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Ubuntu-Bold")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("User Registration!.Please enter your details.",
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Ubuntu-Light")),
          ),
          SizedBox(
            height: height / 20,
          ),
          Text_Field(
              ct,
              "Name",
              false,
              Icon(
                Icons.ac_unit,
                color: Colors.white,
              )),

          new Stack(alignment: const Alignment(1.1, 0.1), children: <Widget>[
            Text_Field(
                ct3,
                "Email",
                false,
                Icon(
                  Icons.vpn_key,
                  color: Colors.white,
                )),
            new FlatButton(
                onPressed: () {
                  debugPrint(ct3.text);
                },
                child: new Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                ))
          ]),
          new Stack(alignment: const Alignment(1.1, 0.1), children: <Widget>[
            Text_Field(
                ct4,
                "Password",
                true,
                Icon(
                  Icons.vpn_key,
                  color: Colors.white,
                )),
            new FlatButton(
                onPressed: () {
                  debugPrint(ct4.text);
                },
                child: new Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                ))
          ]),
          SizedBox(
            height: height / 100,
          ),
      RaisedButton(onPressed: (){



      },),

//          Login_btn("Next", Colors.tealAccent.withOpacity(0.55), ctext, null),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: height / 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Divider(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Login_btn("Back to Login", Colors.orangeAccent.withOpacity(0.7),
              ctext, LoginView()),
          SizedBox(
            height: height / 60,
          ),
          Text("Powered by Flutter Colombo Commiunity|Team mAtrix",
              style: TextStyle(color: Colors.white, fontSize: 10))
        ],
      ),
    ),
  );
}

Widget Text_Field(
    TextEditingController ct, String hint, bool isObsecure, Icon icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: ct,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: isObsecure ? true : false,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}

Widget Login_btn(String text, Color cl, BuildContext ctext, Widget wg) {
  return SizedBox(
    width: 250,
    height: 50,
    child: RaisedButton(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      elevation: 10,
      color: cl,
      onPressed: () => {
      Navigator.push(
      ctext,
      MaterialPageRoute(builder: (ctext) => wg),
    )
    },
    child: Text(
      text,
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'Ubuntu-Bold',
          fontWeight: FontWeight.bold,
          fontSize: 15),
    ),
  ),
  );
}
