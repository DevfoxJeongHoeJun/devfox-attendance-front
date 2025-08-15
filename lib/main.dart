import 'package:attendance_client/screens/company_admin_home_screen.dart';
import 'package:attendance_client/screens/company_create_screen.dart';
import 'package:attendance_client/screens/company_info_screen.dart';
import 'package:attendance_client/screens/employee_attendance_list_screen.dart';
import 'package:attendance_client/screens/group_list_screen.dart';
import 'package:attendance_client/screens/user_create_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'screens/login_screen.dart';
import 'screens/attendance_record_screen.dart';
import 'screens/attendance_record_screen2.dart';
import 'screens/user_more_info_screen.dart';
import 'screens/user_list_screen.dart';
import 'screens/user_detail_info_screen.dart';
import 'screens/app_admin_home_screen.dart';
import 'screens/group_detail_info_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = FlutterSecureStorage();
  final role = await storage.read(key: "role");

  // role에 따른 초기 화면 결정
  String initialRoute = '/login';
  if (role == "ROLE_USER" || role == "ROLE_MANAGER") {
    initialRoute = '/attend/record';
  } else if (role == "ROLE_ADMIN") {
    initialRoute = '/admin/home';
  } else if (role == "ROLE_SUPER") {
    initialRoute = '/app-admin/home';
  }

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '勤怠管理アプリ',
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/user/create': (context) => const UserCreateScreen(),

        // 관리자
        '/admin/home': (context) => const CompanyAdminHomeScreen(),
        '/admin/create': (context) => const CompanyCreateScreen(),
        '/admin/info': (context) => const CompanyInfoScreen(),
        '/admin/userinfo': (context) => const UserAttendanceInfoScreen(),

        // 앱 관리자
        '/app-admin/user-list': (context) => const UserListScreen(),
        '/app-admin/user-detail-info': (context) => const UserDetailInfoScreen(),
        '/app-admin/home': (context) => const AppAdminHomeScreen(),
        '/app-admin/group-list': (context) => const GroupListScreen(),
        '/app-admin/group-detail-info': (context) => const GroupDetailInfoScreen(),

        // 근태
        '/attend/record': (context) => const AttendanceRecordScreen(),
        '/attend/record2': (context) => const AttendanceRecordScreen2(),
        '/attend/list': (context) => const EmployeeAttendanceListScreen(),
        '/attend/details': (context) => const UserAttendanceInfoScreen(),
      },
    );
  }
}
