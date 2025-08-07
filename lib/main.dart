import 'package:attendance_client/screens/company_admin_home_screen.dart';
import 'package:attendance_client/screens/company_app_admin_home_screen.dart';
import 'package:attendance_client/screens/company_create_screen.dart';
import 'package:attendance_client/screens/company_info_screen.dart';
import 'package:attendance_client/screens/employee_attendance_list_screen.dart';
import 'package:attendance_client/screens/user_create_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';  // login.dartをインポート
import 'screens/attendance_record_screen.dart';
import 'screens/user_more_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '勤怠管理アプリ',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(), // 後で初期画面（認証）
        '/login': (context) => const LoginScreen(),
        '/user/create': (context) => const UserCreateScreen(),
        '/admin/home': (context) => const CompanyAdminHomeScreen(),
        '/admin/info': (context) => const CompanyInfoScreen(),
        '/admin/userinfo': (context) => const UserAttendanceInfo(),
        '/attend/record': (context) => const AttendanceRecordScreen(),
        '/attend/list': (context) => const EmployeeAttendanceListScreen(),
        '/app-admin/home': (context) => const CompanyAppAdminHomeScreenAdminHomeScreen(),
        '/app-admin/company/create': (context) => const CompanyCreateScreen(),
      },
    );
  }

}

