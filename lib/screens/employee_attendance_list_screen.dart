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
        '社員勤怠一覧',
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
                  hintText: '開始日',
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
                  hintText: '終了日',
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
              hintText: '社員氏名で検索',
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
        'name': '社員氏名',
        'home': '在宅',
        'status1': '出勤・未定｜未定',
        'status2': '退勤・未定｜07.30 09:30',
      },
      {
        'name': '社員氏名',
        'home': '出社',
        'status1': '出勤・位置｜07.30 09:30',
        'status2': '退勤・未定｜07.30 18:30',
      },
      {
        'name': '社員氏名',
        'home': '退勤',
        'status1': '出勤・位置｜07.30 09:30',
        'status2': '退勤・未定｜07.30 18:30',
      },
      {
        'name': '社員氏名',
        'home': '退勤',
        'status1': '出勤・位置｜07.30 09:30',
        'status2': '退勤・未定｜07.30 18:30',
      },
      {
        'name': '社員氏名',
        'home': '退勤',
        'status1': '出勤・位置｜07.30 09:30',
        'status2': '退勤・未定｜07.30 18:30',
      },
      {
        'name': '社員氏名',
        'home': '退勤',
        'status1': '出勤・位置｜07.30 09:30',
        'status2': '退勤・未定｜07.30 18:30',
      },
    ];

    return Column(
      children: employees.map((employee) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    employee['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(employee['status1']!),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(employee['home']!), Text(employee['status2']!)],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
