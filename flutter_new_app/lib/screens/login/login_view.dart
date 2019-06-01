import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bot/blocs/login_validator_bloc.dart';
import 'package:flutter_bot/screens/register/register_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "LOGIN",
            style: TextStyle(
                fontSize: 27,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu-Bold'),
          ),
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
                child: Login_container(width / 1.1, height / 1.5, context)),
          )
        ],
      ),
    );
  }
}

Widget Login_container(double width, double height, BuildContext ctext) {
  TextEditingController ct = TextEditingController();
  TextEditingController ct2 = TextEditingController();

  final loginValidator = Provider.of<LoginValidator>(ctext);
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
            child: Text("Flutter HUB",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Ubuntu-Bold")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("Welcome back!.Please login to your account.",
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              onChanged: (val) {
              loginValidator.setEmail(val);
//
//                loginValidator.validateEmail();
              },
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                ),
                hintText: "Username",
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
          ),
          new Stack(alignment: const Alignment(1.1, 0.1), children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                onChanged: (val) {
                  loginValidator.setPassword(val);

                },
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.white,
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            new FlatButton(
                onPressed: () {
                  debugPrint(ct2.text);
                },
                child: new Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                ))
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Checkbox(
                onChanged: (bool value) {},
                value: true,
                activeColor: Colors.white,
                checkColor: Colors.black,
              ),
              Text(
                "Remember me",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: height / 100,
          ),
          loginValidator.ValidEmail?Login_btn("Login", Colors.tealAccent.withOpacity(0.55), ctext, null):RaisedButton(color: Colors.red,),
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
          Login_btn("Create Account", Colors.orangeAccent.withOpacity(0.7),
              ctext, RegisterView()),
          SizedBox(
            height: height / 60,
          ),
          Text("Powered by Extreame IT Solutions | www.extremeit.lk",
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

Widget Login_btn(String text, Color cl, BuildContext ct, Widget wg) {
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
              ct,
              MaterialPageRoute(builder: (ct) => wg),
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
