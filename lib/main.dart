import 'package:attendance_client/screens/attendance_record_screen.dart';
import 'package:flutter/material.dart';
import 'screens/company_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '勤怠管理アプリ',
      initialRoute: '/',
      routes: {
        '/': (context) => const CompanyInfoScreen(),
        '/attend': (context) => const AttendanceRecordScreen(),
      },
    );
  }


}
