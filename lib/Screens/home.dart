import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/Screens/Exam/Exam_Rseult.dart';
import 'package:school_management/Widgets/AppBar.dart';
import 'package:school_management/Widgets/BouncingButton.dart';
import 'package:school_management/Widgets/DashboardCards.dart';
import 'package:school_management/Widgets/MainDrawer.dart';
import 'package:school_management/Widgets/UserDetailCard.dart';

import 'Attendance/Attendance.dart';
import 'Leave_Apply/Leave_apply.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
    SystemChrome.setEnabledSystemUIOverlays([]);
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

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        final GlobalKey<ScaffoldState> _scaffoldKey =
            new GlobalKey<ScaffoldState>();
        return Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            elevation: 0,
            child: MainDrawer(),
          ),
          appBar: CommonAppBar(
            menuenabled: true,
            notificationenabled: true,
            ontap: () {
              _scaffoldKey.currentState.openDrawer();
            },
            title: "DASHBOARD",
          ),
          body: ListView(
            children: [
              UserDetailCard(),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 10, 30, 10),
                child: Container(
                  alignment: Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(
                              muchDelayedAnimation.value * width, 0, 0),
                          child: Bouncing(
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Attendance(),
                                  ));
                            },
                            child: DashboardCard(
                              name: "Attendance",
                              imgpath: "attendance.png",
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.translationValues(
                              delayedAnimation.value * width, 0, 0),
                          child: Bouncing(
                            onPress: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LeaveApply(),
                                ));},
                            child: DashboardCard(
                              name: "E-gatepass",
                              imgpath: "leave_apply.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 10, 30, 10),
                child: Container(
                  alignment: Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(
                              muchDelayedAnimation.value * width, 0, 0),
                          child: Bouncing(
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ExamResult(),
                                  ));
                            },
                            child: DashboardCard(
                              name: "Exam",
                              imgpath: "exam.png",
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.translationValues(
                              delayedAnimation.value * width, 0, 0),
                          child: Bouncing(
                            onPress: () {},
                            child: DashboardCard(
                              name: "Group Links",
                              imgpath: "wa1.png" ,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 10, 30, 10),
                child: Container(
                  alignment: Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(
                              muchDelayedAnimation.value * width, 0, 0),
                          child: Bouncing(
                            onPress: () {},
                            child: DashboardCard(
                              name: "Library",
                              imgpath: "library.png",
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.translationValues(
                              delayedAnimation.value * width, 0, 0),
                          child: Bouncing(
                            onPress: () {},
                            child: DashboardCard(
                              name: "Canteen",
                              imgpath: "junk.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: Container(
                  alignment: Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(
                              muchDelayedAnimation.value * width, 0, 0),

                        ),
                        Transform(
                          transform: Matrix4.translationValues(
                              delayedAnimation.value * width, 0, 0),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
