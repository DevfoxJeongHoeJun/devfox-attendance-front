import 'package:flutter/material.dart';

class UserAttendanceInfo extends StatefulWidget {
  const UserAttendanceInfo({Key? key}) : super(key: key);

  @override
  UserAttendanceInfoScreenState createState() => UserAttendanceInfoScreenState();
}


class UserAttendanceInfoScreenState extends State<UserAttendanceInfo> {
  void _login() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ユーザーの出退勤詳細情報',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'ユーザー名',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String?>(
              decoration: InputDecoration(
                labelText: 'カレンダー',
                labelStyle: TextStyle(fontSize: 15, color: Color(0xffcfcfcf)),
              ),
              onChanged: (String? newValue) {
                print(newValue);
              },
              items:
              [null,
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
                '10',
                '11',
                '12'
              ].map<DropdownMenuItem<String?>>((String? i) {
                return DropdownMenuItem<String?>(
                  value: i,
                  child:
                  Text(
                      {'1': '1月',
                        '2': '2月',
                        '3': '3月',
                        '4': '4月',
                        '5': '5月',
                        '6': '6月',
                        '7': '7月',
                        '8': '8月',
                        '9': '9月',
                        '10': '10月',
                        '11': '11月',
                        '12': '12月',}[i] ?? '7月'),
                );
              }).toList(),
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
                    child: Row(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '27',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '28',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '29',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '30',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '31',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:38),
                        Container(
                          child: const Center(
                            child: Text(
                              '2',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '3',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(width:37),
                        Container(
                          child: const Center(
                            child: Text(
                              '4',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:37),
                        Container(
                          child: const Center(
                            child: Text(
                              '5',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:36),
                        Container(
                          child: const Center(
                            child: Text(
                              '6',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:37),
                        Container(
                          child: const Center(
                            child: Text(
                              '7',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:37),
                        Container(
                          child: const Center(
                            child: Text(
                              '8',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:37),
                        Container(
                          child: const Center(
                            child: Text(
                              '9',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),

                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '10',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '11',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '12',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '13',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '14',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '15',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '16',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),

                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '17',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '18',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '19',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '20',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '21',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '22',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '23',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),

                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '24',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '25',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '26',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '27',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '28',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '29',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '30',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),

                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '31',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(width:25),
                        Container(
                          child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width:38),
                        Container(
                          child: const Center(
                            child: Text(
                              '2',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width:38),
                        Container(
                          child: const Center(
                            child: Text(
                              '3',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width:38),
                        Container(
                          child: const Center(
                            child: Text(
                              '4',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width:38),
                        Container(
                          child: const Center(
                            child: Text(
                              '5',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(width:38),
                        Container(
                          child: const Center(
                            child: Text(
                              '6',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: const Center(
                      child: Text(
                        '・出勤 21(総：168時間)',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: const Center(
                      child: Text(
                        '・欠勤 1',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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