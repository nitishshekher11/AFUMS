import 'package:flutter/material.dart';
import 'package:school_management/Widgets/Attendance/AttendanceCard.dart';

class TodayAttendance extends StatefulWidget {
  @override
  _TodayAttendanceState createState() => _TodayAttendanceState();
}

class _TodayAttendanceState extends State<TodayAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         AttendanceCard(attendance: true,
         endtime: "10:20 AM",
         staff: "Er. Shalini gill",
         starttime: "9:30 AM",
         subject: "A.I.",
         ),
         AttendanceCard(attendance: false,
         endtime: "11:20 AM",
         staff: "Er. Punit soni",
         starttime: "10:30 AM",
         subject: "Python Lab",
         ),
          
        ],
      ),
    );
  }
}
