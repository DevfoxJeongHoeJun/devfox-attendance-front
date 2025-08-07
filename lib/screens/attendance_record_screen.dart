import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceRecordScreen extends StatelessWidget {
  const AttendanceRecordScreen({super.key});

  void _login() {
  }

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
                // borderRadius: BorderRadius.circular(12),
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

                  DropdownButtonFormField<String?>(
                    decoration: InputDecoration(
                      labelText: '業務形態',
                      labelStyle: TextStyle(fontSize: 15, color: Color(0xffcfcfcf)),
                    ),
                    onChanged: (String? newValue) {
                      print(newValue);
                    },
                    items:
                    [null, '出社', '在宅'].map<DropdownMenuItem<String?>>((String? i) {
                      return DropdownMenuItem<String?>(
                        value: i,
                        child: Text({'出社': '出社', '在宅': '在宅'}[i] ?? '業務形態'),
                      );
                    }).toList(),
                  ),
                  // TextField(
                  //
                  //   obscureText: true,
                  //   decoration: const InputDecoration(
                  //     labelText: '業務形態',
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(10)),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height:15),
                  // ElevatedButton(
                  //   onPressed: _login,
                  //   style: ElevatedButton.styleFrom(
                  //     minimumSize: const Size(double.infinity, 60),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     backgroundColor: Colors.blue,
                  //     foregroundColor: Colors.white,
                  //     textStyle: const TextStyle(fontSize: 20),
                  //   ),
                  //   child: const Text(
                  //     '出勤',
                  //     style: TextStyle(
                  //       fontSize: 25,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height:15),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text(
                      '退勤',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
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