import 'package:attendance_client/screens/company_admin_home_screen.dart';
import 'package:attendance_client/screens/company_app_admin_home_screen.dart';
import 'package:attendance_client/screens/company_create_screen.dart';
import 'package:attendance_client/screens/company_info_screen.dart';
import 'package:attendance_client/screens/employee_attendance_list_screen.dart';
import 'package:attendance_client/screens/group_list_screen.dart';
import 'package:attendance_client/screens/user_create_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';  // login.dartをインポート
import 'screens/attendance_record_screen.dart';
import 'screens/user_more_info_screen.dart';
import 'screens/user_list_screen.dart';
import 'screens/user_detail_info_screen.dart';
import 'screens/app_admin_home_screen.dart';
import 'screens/group_detail_info_screen.dart';

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

        //新規登録
        '/user/create': (context) => const UserCreateScreen(),

        //管理者
        '/admin/home': (context) => const CompanyAdminHomeScreen(),
        '/admin/create': (context) => const CompanyCreateScreen(),
        '/admin/info': (context) => const CompanyInfoScreen(),
        '/admin/userinfo': (context) => const UserAttendanceInfoScreen(),

        //アプリ管理者
        '/app-admin/user-list': (context) => const UserListScreen(),
        '/app-admin/user-detail-info': (context) => const UserDetailInfoScreen(),
        '/app-admin/home': (context) => const AppAdminHomeScreen(),
        '/app-admin/group-list': (context) => const GroupListScreen(),
        '/app-admin/group-detail-info': (context) => const GroupDetailInfoScreen(),

        //勤怠
        '/attend/record': (context) => const AttendanceRecordScreen(),
        '/attend/list': (context) => const EmployeeAttendanceListScreen(),
        '/attend/details': (context) => const UserAttendanceInfoScreen(),

      },
    );
  }

}

