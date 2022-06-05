import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:school_management/Screens/home.dart';
import 'package:school_management/Widgets/BouncingButton.dart';
import 'package:school_management/services/UserModel.dart';

import '../Widgets/BouncingButton.dart';
import '../services/UserModel.dart';
import 'ForgetPassword.dart';
import 'RequestLogin.dart';
import 'home.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    LeftCurve = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  UserModel _userfromfirebase(FirebaseUser user) {
    return user != null ? UserModel(uid: user.uid) : null;
    print(user);
  }

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool passshow = false;
  String _pass;
  String _email;
  String user1;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Transform(
                  transform: Matrix4.translationValues(
                      animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Stack(
                      children: <Widget>[

                        Container(
                          child:
                          Text('AFUMS', style:
                            TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(135.0, 0.0, 0, 30),
                          child: Container(
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.red[400],
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: Transform(
                  transform:
                      Matrix4.translationValues(LeftCurve.value * width, 0, 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Form(
                            key: _formkey,
                            autovalidateMode: AutovalidateMode.always,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if ((Fzregex.hasMatch(
                                            value, FzPattern.email) ==
                                        false)) {
                                      return "";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    _email = value;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'UID',
                                    contentPadding: EdgeInsets.all(5),
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  obscuringCharacter: '●',
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    _pass = val;
                                  },
                                  decoration: InputDecoration(
                                      suffix: passshow == false
                                          ? IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  passshow = true;
                                                });
                                              },
                                              icon: Icon(Icons.lock_open),
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  passshow = false;
                                                });
                                              },
                                              icon: Icon(Icons.lock),
                                            ),
                                      labelText: 'PASSWORD',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  obscureText: passshow == false ? true : false,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0, 0),
                  child: Container(
                    alignment: Alignment(1.0, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1.0, right: 0.0),
                      child: Bouncing(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgetPassword(),
                              ));
                        },
                        child: Center(child: Text(
                          "Forgot password ?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black54,)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(80.0, 5, 80.0, 5),

                child: Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Bouncing(
                          onPress: () {
                            if (_formkey.currentState.validate()) {
                              _formkey.currentState.save();
                              /*try {
                                final FirebaseUser user =
                                    (await _auth.signInWithEmailAndPassword(
                                  email: _email,
                                  password: _pass,
                                ))
                                        .user;
                                dynamic userinfo = _auth.currentUser;
                                return _userfromfirebase(userinfo);
                              } catch (e) {
                                if (e.code == 'user-not-found') {
                                  print("user not found");
                                } else if (e.code == 'wrong-password') {
                                  print("wrong password");
                                } else {
                                  print("check internet connection!");
                                }
                              }
                            } else {
                              setState(() {
                                _autoValidate = true;
                              });
                            }*/

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Home(),
                                  ));
                            }
                            ;
                          },
                          child: MaterialButton(
                            onPressed: () {},
                            elevation: 5.0,
                            minWidth: MediaQuery.of(context).size.width,
                            color: Colors.red,
                            child: Text(
                              "Log-in",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white),



                            ),
                          ),
                        ),
                        SizedBox(height: 10.0 ,),

                        Bouncing(
                          onPress: () {},
                          child: MaterialButton(
                            onPressed: () {

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RequestLogin(),
                                  ));

                            },
                            elevation: 3.0,
                            minWidth: MediaQuery.of(context).size.width,
                            color: Colors.cyan[300],
                            child: ListTile(
                              title: Center(child: Text(
                                  "Sign-up / Register",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black,)
                              ),
                              ),
                          ),
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        );
      },
    );
  }
}
class Logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    AssetImage assetImage=AssetImage("assets/images/login-logo.png");
        Image image=Image(image: assetImage);
    return Container(child: image,);
  }

}