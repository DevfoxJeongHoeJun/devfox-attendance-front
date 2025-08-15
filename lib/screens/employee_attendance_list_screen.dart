import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EmployeeAttendanceListScreen extends StatefulWidget {
  const EmployeeAttendanceListScreen({super.key});

  @override
  State<EmployeeAttendanceListScreen> createState() => _EmpAttandState();
}

class _EmpAttandState extends State<EmployeeAttendanceListScreen> {

  // LocalStorageを利用するためのライブラリ
  final storage = new FlutterSecureStorage();

  // 検索・フィルターの入力コントローラー
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  // リストスクロールコントローラー
  ScrollController scrollController = ScrollController();

  // ステータス値：勤怠状態「0 = 全体」、「1 = 欠勤」
  String selectedStatus = '0';

  // 勤怠一覧リスト（ページングデータは append される）
  List<Map<String, dynamic>> employees = [];

  // ページング初期値
  int page = 0;   // 現在のページ番号
  int size = 10;  // 一つのページに出力するデータ数

  //　ローディング状態
  bool isLoading = false; // 重複ローディング防止「ture = すでにローディング中」
  bool hasMore = true;    // 次のページの存在可否（サーバー側の Pageable アノテーションで取得可能）

  // 初期状態
  @override
  void initState() {
    super.initState();

    // 初期日時を本日に設定
    final today = DateTime.now();
    startDateController.text = DateFormat('yyyy-MM-dd').format(today);
    endDateController.text = DateFormat('yyyy-MM-dd').format(today);

    // 初期検索キーワードなしに設定
    searchController.text = '';

    // スクロールリスナー登録
    scrollController.addListener(_onScroll);

    // 初期ページを呼び出し
    _handleSearch();
  }

  // スクロールイベント処理
  void _onScroll() {
    // すでにローディング中及び次のページがなければ処理終了
    if (isLoading || !hasMore) return;

    // 現在のスクロール位置が「最大スクロール長さ - 200」以上なら、次のページを呼び出し
    final current = scrollController.position.pixels;
    final max = scrollController.position.maxScrollExtent;

    if (current >= max - 200) {
      _handleSearch();
    }
  }

  // 勤怠一覧データ取得 API を呼び出し
  // 変数の isRefresh が true　の場合はページ ① から呼び出し（初期表示、検索した場合）
  // 変数の isRefresh が false の場合は次のページを呼び出し
  Future<void> _handleSearch({bool isRefresh = false}) async {

    // すてにローディング中なら処理終了
    if (isLoading) return;

    //　ローディング中の状態に変更
    setState(() {
      isLoading = true;
    });

    if (isRefresh) {
      page = 0;
    }


    final groupCode = await storage.read(key: "groupCode");

    if (groupCode == null || groupCode.isEmpty) {
      Navigator.of(context).pushReplacementNamed('/login');
      return;
    }

    final url = Uri.parse("http://localhost:8080/api/group/attend-list?page=${page}&size=${size}");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "groupCode": groupCode,
        "startDate": startDateController.text,
        "endDate": endDateController.text,
        "status": selectedStatus,
        "userName": searchController.text
      }),
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> bodyList = decoded['body']['content'] ?? [];

      setState(() {
        employees = bodyList.map((e) => Map<String, dynamic>.from(e)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PageTitle(),
              const SizedBox(height: 16),
              const SearchText(),
              const SizedBox(height: 8),
              DateRangeInput(
                startController: startDateController,
                endController: endDateController
              ),
              const SizedBox(height: 8),
              StatusSelector(
                value: selectedStatus,
                onChanged: (val) => {
                  setState(() {
                    selectedStatus = val;
                  })
                },
              ),
              const SizedBox(height: 8),
              NameSearchInput(
                controller: searchController,
                onSearch: () {
                  _handleSearch();
                },
              ),
              const SizedBox(height: 16),
              EmployeeList(employees: employees),
            ],
          ),
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ユーザー勤怠一覧',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('勤怠日', style: TextStyle(fontSize: 16)),
    );
  }
}

class DateRangeInput extends StatefulWidget {
  final TextEditingController startController;
  final TextEditingController endController;

  const DateRangeInput({
    super.key,
    required this.startController,
    required this.endController,
  });

  @override
  State<DateRangeInput> createState() => _DateRangeInputState();
}

//検索日付Widget
class _DateRangeInputState extends State<DateRangeInput> {

  Future<void> _selectDate(bool isStart) async {
    final initialDate = DateTime.tryParse(
      isStart ? widget.startController.text : widget.endController.text,
    ) ??
        DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      final formatted = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      if (isStart) {
        widget.startController.text = formatted;
      } else {
        widget.endController.text = formatted;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _selectDate(true),
            child: AbsorbPointer(
              child: TextField(
                controller: widget.startController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text('〜'),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () => _selectDate(false),
            child: AbsorbPointer(
              child: TextField(
                controller: widget.endController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StatusSelector extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const StatusSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final Map<String, String> statusOptions = const {
    'すべて': '0',
    '欠勤': '1',
  };

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: statusOptions.entries
          .map((entry) => DropdownMenuItem(
        value: entry.value,
        child: Text(entry.key),
      ))
          .toList(),
      onChanged: (newValue) {
        if (newValue != null) {
          onChanged(newValue);
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}


class NameSearchInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const NameSearchInput({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              hintText: 'ユーザー氏名で検索',
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
              border: OutlineInputBorder(),
              isDense: false,
            ),
          ),
        ),
        const SizedBox(width: 8),

        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: onSearch,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: const Size(48, 48),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 0,
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: const Text('検索'),
          ),
        ),
      ],
    );
  }
}

class EmployeeList extends StatefulWidget {
  final List<Map<String, dynamic>> employees;
  const EmployeeList({super.key, required this.employees});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    final employees = widget.employees;

    return Column(
      children: employees.map((employee) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/attend/details');
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        employee['userName'] ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '出勤',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        employee['startTime'] != null && employee['startTime']!.isNotEmpty
                            ? DateFormat('MM/dd HH:mm').format(DateTime.parse(employee['startTime']))
                            : '-- : --',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        (employee['type'] == '1')
                            ? '出社'
                            : (employee['type'] == '2')
                            ? '在宅'
                            : '欠勤',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '退勤',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        employee['endTime'] != null && employee['endTime']!.isNotEmpty
                            ? DateFormat('MM/dd HH:mm').format(DateTime.parse(employee['endTime']))
                            : '-- : --',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

