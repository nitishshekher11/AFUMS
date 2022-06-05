import 'package:flutter/material.dart';
import 'package:school_management/Widgets/Attendance/OverAllAttendanceCard.dart';

class OverallAttendance extends StatefulWidget {
  @override
  _OverallAttendanceState createState() => _OverallAttendanceState();
}

class _OverallAttendanceState extends State<OverallAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        OverallAttendanceCard(
          date: "15.05.2022",
          day: "sunday",
          firsthalf: true,
          secondhalf: false,
        ),
         OverallAttendanceCard(
          date: "15.12.2020",
          day: "monday",
          firsthalf: true,
          secondhalf: false,
        ),
         OverallAttendanceCard(
          date: "15.12.2020",
          day: "friday",
          firsthalf: true,
          secondhalf: false,
        ),
        OverallAttendanceCard(
          date: "15.12.2020",
          day: "tuesday",
          firsthalf: true,
          secondhalf: false,
        ),
        OverallAttendanceCard(
          date: "15.12.2020",
          day: "sunday",
          firsthalf: true,
          secondhalf: false,
        ),
        OverallAttendanceCard(
          date: "15.12.2020",
          day: "sunday",
          firsthalf: true,
          secondhalf: false,
        ),
        OverallAttendanceCard(
          date: "15.12.2020",
          day: "sunday",
          firsthalf: true,
          secondhalf: false,
        ),
        OverallAttendanceCard(
          date: "15.12.2020",
          day: "sunday",
          firsthalf: true,
          secondhalf: false,
        ),
        OverallAttendanceCard(
          date: "15.12.2020",
          day: "sunday",
          firsthalf: true,
          secondhalf: false,
        ),
        OverallAttendanceCard(
          date: "15.12.2020",
          day: "sunday",
          firsthalf: true,
          secondhalf: false,
        ),
        OverallAttendanceCard(
          date: "15.12.2020",
          day: "sunday",
          firsthalf: true,
          secondhalf: false,
        ),
      ],),
    );
  }
}