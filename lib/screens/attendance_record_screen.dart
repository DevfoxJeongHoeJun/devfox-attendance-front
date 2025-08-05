import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceRecordScreen extends StatelessWidget {
  const AttendanceRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
    return Scaffold(

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: const  Center(
                child: Text(
                  '出退勤打刻',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 14),
              child: Center(
                child: Text(
                  '$formattedDate',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              )
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: const Center(
                              child: Text(
                                '出勤時間',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          Center(
                            child: const Text(
                              '--:--',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ),
                        ],
                      )
                  ),

                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: const Center(
                              child: Text(
                                '退勤時間',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          Center(
                              child: const Text(
                                '--:--',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              )
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Text(
                      'ユーザー氏名',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Text(
                      'GPS情報（地域名）',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}