import 'dart:convert';
import 'package:http/http.dart' as httpdart;
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';


class AttendanceRecordScreen extends StatefulWidget {
  const AttendanceRecordScreen({super.key});
  @override
  _AttendanceRecordScreenState createState() => _AttendanceRecordScreenState();
}

class _AttendanceRecordScreenState extends State<AttendanceRecordScreen> {
  String? selectedWorkType; // Dropdown 選沢値を保存
  bool isWorking = false;
  bool hasEnded = false;
  final storage = const FlutterSecureStorage();
  String? lastWorkDate; //今日日付
  String? startTime;//出勤時間
  String? endTime; //退勤時間

  void _userMoreInfo(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      '/admin/userinfo',
    );
  }

  Future<httpdart.Response> postAttend(Map<String, dynamic> body) async {
    final url = Uri.parse('http://localhost:8080/api/user/addAttend');
    return await httpdart.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
  }

  Future<httpdart.Response> putAttend(int attendId, Map<String, dynamic> body) async {
    final url = Uri.parse('http://localhost:8080/api/user/update/$attendId');
    return await httpdart.put(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
  }

  Future<void> sendAttendance(String workType, bool isStart) async {
    final userId = await storage.read(key: "userId");
    final username = await storage.read(key: "username");
    final now = DateTime.now(); // 변경: LocalDateTime 전용 변수
    final todayDate = DateFormat('yyyy-MM-dd').format(now); // 변경: 날짜만
    final nowTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now); // 변경: 시간 포함

    final url = Uri.parse('http://localhost:8080/api/user/searchAttend/${userId}');

    final body = jsonEncode({ //もっとデータ必要
      "id": null,
      "userId": int.tryParse(userId ??"0"),
      "date": todayDate,
      "type": workType,
      "startTime": isStart ? nowTime : null,
      "startLocation": isStart ? "雑色" : null,
      "endTime": !isStart ? nowTime : null,
      "endLocation": !isStart ? "雑色" : null,
      "createdAt": nowTime,
      "createdUser": username ?? "system",
      "updatedAt": nowTime,
      "updatedUser": username ?? "system"
    });

    if (userId == null) {
      print("ユーザーIDが存在しません");
      return;
    }

    try {
      final response = await httpdart.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final respBody = jsonDecode(response.body);
        await storage.write(key: "lastAttendId", value: respBody["id"].toString());
        print("出勤情報伝送成功");
      } else {
        print("出勤情報伝送失敗: ${response.statusCode}");
      }
    } catch (e) {
      print("出勤情報伝エラー: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
    final usename = storage.read(key: "username");

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
                              child: Text(
                                startTime ?? '--:--',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                              child: Text(
                                endTime ?? '--:--',
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
              ),
              //ソンヒョン
              child: FutureBuilder<String?>(
                future: storage.read(key: "username"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('エラーが発生しました');
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Text('ユーザーIDが存在しません');
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( // ログインユーザー名表示
                          '${snapshot.data}',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 14),
                        Text(// GPS 情報
                          'GPS情報（地域名）',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 14),

                        // Dropdown BOX--------------------------------------------------------------
                        DropdownButtonFormField<String?>(
                          value: selectedWorkType,
                          decoration: InputDecoration(
                            labelText: '業務形態',
                            labelStyle: TextStyle(fontSize: 15, color: Color(0xffcfcfcf)),
                          ),
                          hint: const Text('業務形態'),
                          onChanged: (String? newValue) {
                            print(newValue);
                            setState(() {
                              selectedWorkType = newValue;
                            });
                          },
                          items: ['出社', '在宅']
                              .map<DropdownMenuItem<String?>>((String? i) {
                            return DropdownMenuItem<String?>(
                              value: i,
                              child: Text(i!),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 15),

                        // 出勤退勤ボタン機能
                        ElevatedButton(
                          onPressed: () async {
                            if (selectedWorkType == null) { //業務形態そのまま
                              Flushbar(
                                message: '出勤処理に失敗しました。',
                                duration: Duration(seconds: 2),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Colors.red,
                                margin: EdgeInsets.all(16),
                                borderRadius: BorderRadius.circular(8),
                                icon: Icon(Icons.warning, color: Colors.white),
                              ).show(context);
                              return;
                            } else {
                              final userId = await storage.read(key: "userId");
                              final username = await storage.read(key: "username");
                              final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
                              final lastWorkDate = await storage.read(key: "lastWorkDate");
                              print(today);
                              if (lastWorkDate != today) {
                                // 今日最初出勤
                                final body = {
                                  "userId": int.tryParse(userId ?? "0"),
                                  "date": today,
                                  "type": selectedWorkType,
                                  "startTime": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                  "startLocation": "雑色",
                                  "createdUser": username ?? "system",
                                };
                                final response = await postAttend(body); //出勤 POST 呼び出す
                                if (response.statusCode == 200) {
                                  final respBody = jsonDecode(response.body);
                                  await storage.write(key: "lastAttendId", value: respBody["id"].toString());
                                  await storage.write(key: "lastWorkDate", value: today);

                                  setState(() {
                                    startTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
                                    isWorking = true;
                                    endTime = null;
                                  });
                                  print("出勤成功: $selectedWorkType");
                                } else {
                                  print("出勤失敗: ${response.statusCode}");
                                }
                              }
                              else{ // 今日出勤した場合、退勤だけ可能
                                final attendId = await storage.read(key: "lastAttendId");
                                if (attendId == null) {
                                  print("退勤IDが存在しません");
                                  return;
                                }

                                final body = {
                                  "endTime": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                  "endLocation": "雑色",
                                  "updatedUser": username ?? "system",
                                };

                                final response = await putAttend(int.parse(attendId), body);
                                if (response.statusCode == 200) {
                                  setState(() {
                                    endTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
                                    isWorking = false;
                                  });
                                  print("退勤成功: $selectedWorkType");
                                } else {
                                  print("退勤失敗: ${response.statusCode}");
                                }
                              }
                            }
                          }, style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: isWorking ? Colors.amber : Colors.indigo,
                            foregroundColor: isWorking ? Colors.black : Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: Text(
                            isWorking ? '退勤' : '出勤',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),

              child: Column(
                  children:[
                    ElevatedButton(
                      onPressed: () => _userMoreInfo(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text(
                        '自分の勤怠詳細へ',
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