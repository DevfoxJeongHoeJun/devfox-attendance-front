import 'package:flutter/material.dart';

class EmployeeAttendanceListScreen extends StatelessWidget {
  const EmployeeAttendanceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              PageTitle(),
              SizedBox(height: 16),
              SearchText(),
              SizedBox(height: 8),
              DateRangeInput(),
              SizedBox(height: 8),
              StatusSelector(),
              SizedBox(height: 8),
              NameSearchInput(),
              SizedBox(height: 16),
              EmployeeList(),
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
  const DateRangeInput({super.key});

  @override
  State<DateRangeInput> createState() => _DateRangeInputState();
}

//検索日付Widget
class _DateRangeInputState extends State<DateRangeInput> {
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(bool isStart) async {
    final DateTime initialDate = DateTime.now();
    final DateTime firstDate = DateTime(2020);
    final DateTime lastDate = DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart
          ? (_startDate ?? initialDate)
          : (_endDate ?? initialDate),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 開始日
        Expanded(
          child: GestureDetector(
            onTap: () => _selectDate(true),
            child: AbsorbPointer(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: '2025/07/30',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 10,
                  ),
                ),
                controller: TextEditingController(
                  text: _formatDate(_startDate),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text('〜'),
        const SizedBox(width: 8),

        // 終了日
        Expanded(
          child: GestureDetector(
            onTap: () => _selectDate(false),
            child: AbsorbPointer(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: '2025/07/30',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 10,
                  ),
                ),
                controller: TextEditingController(text: _formatDate(_endDate)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StatusSelector extends StatefulWidget {
  const StatusSelector({super.key});

  @override
  State<StatusSelector> createState() => _StatusSelectorState();
}

class _StatusSelectorState extends State<StatusSelector> {
  String selectedStatus = 'すべて';
  final List<String> statusOptions = ['すべて', '出社', '退勤', '在宅'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedStatus,
      items: statusOptions
          .map((status) => DropdownMenuItem(value: status, child: Text(status)))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedStatus = value!;
        });
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}

class NameSearchInput extends StatelessWidget {
  const NameSearchInput({super.key});

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
            onPressed: () {},
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

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> employees = [
      {
        'mark': 'X',
        'name': 'キムさん',
        'home': '在宅',
        'status1_type': '出勤',
        'status1_loc': '雑色',
        'status1_time': '07/30 09:28',
        'status2_type': '退勤',
        'status2_loc': '雑色',
        'status2_time': '07/30 18:35',
      },
      {
        'mark': 'X',
        'name': 'ソンさん',
        'home': '在宅',
        'status1_type': '出勤',
        'status1_loc': '雑色',
        'status1_time': '07/30 09:30',
        'status2_type': '退勤',
        'status2_loc': '雑色',
        'status2_time': '07/30 18:33',
      },
      {
        'mark': 'X',
        'name': 'チョイさん',
        'home': 'ー',
        'status1_type': '出勤',
        'status1_loc': 'ー',
        'status1_time': '--:--',
        'status2_type': '退勤',
        'status2_loc': 'ー',
        'status2_time': '--:--',
      },
    ];

    return Column(
      children: employees.map((employee) {
        return Container(
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
                  SizedBox(
                    width: 20,
                    child: Text(
                      employee['mark'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      employee['name'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(employee['status1_type'] ?? ''),
                  ),
                  Expanded(flex: 1, child: Text(employee['status1_loc'] ?? '')),
                  Expanded(
                    flex: 2,
                    child: Text(employee['status1_time'] ?? ''),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              Row(
                children: [
                  const SizedBox(width: 20),
                  const Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    flex: 1,
                    child: Text(employee['status2_type'] ?? ''),
                  ),
                  Expanded(flex: 1, child: Text(employee['status2_loc'] ?? '')),
                  Expanded(
                    flex: 2,
                    child: Text(employee['status2_time'] ?? ''),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
