import 'package:flutter/material.dart';
import 'result.dart';

/* ================= หน้า Input ================= */

class GradeInputPage extends StatefulWidget {
  const GradeInputPage({super.key});

  @override
  State<GradeInputPage> createState() => _GradeInputPageState();
}

class _GradeInputPageState extends State<GradeInputPage> {
  final nameCtrl = TextEditingController();
  final surnameCtrl = TextEditingController();

  String major = 'INE';

  final List<String> subjects = [
    'INTRO TO INFO & NETWORK ENG',
    'COMPUTER PROGRAMMING',
    'DISCRETE MATH & APPLICATION',
    'STAT FOR DATA ENG & SCIENTISTS',
  ];

  final List<String> selectedSubjects = List.generate(
    4,
    (_) => 'INTRO TO INFO & NETWORK ENG',
  );

  final List<TextEditingController> scoreCtrl = List.generate(
    12,
    (_) => TextEditingController(),
  );

  void calculateGrade() {
    List<Map<String, dynamic>> results = [];

    for (int i = 0; i < 4; i++) {
      int base = i * 3;
      int keep = int.tryParse(scoreCtrl[base].text) ?? 0;
      int mid = int.tryParse(scoreCtrl[base + 1].text) ?? 0;
      int fin = int.tryParse(scoreCtrl[base + 2].text) ?? 0;

      int total = keep + mid + fin;
      String grade = getGrade(total);

      results.add({
        'subject': selectedSubjects[i],
        'keep': keep,
        'mid': mid,
        'final': fin,
        'total': total,
        'grade': grade,
      });
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          name: nameCtrl.text,
          surname: surnameCtrl.text,
          major: major,
          results: results,
        ),
      ),
    );
  }

  String getGrade(int score) {
    if (score > 100 || score < 0) return 'Invalid';
    if (score >= 80) return 'A';
    if (score >= 75) return 'B+';
    if (score >= 70) return 'B';
    if (score >= 65) return 'C+';
    if (score >= 60) return 'C';
    if (score >= 55) return 'D+';
    if (score >= 50) return 'D';
    return 'F';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Grade Calculator'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /* ---------- Student Info ---------- */
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '1. ข้อมูลนักศึกษา',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: nameCtrl,
                      decoration: const InputDecoration(
                        labelText: 'ชื่อ',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: surnameCtrl,
                      decoration: const InputDecoration(
                        labelText: 'นามสกุล',
                        prefixIcon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Text(
                          'สาขา:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        Radio<String>(
                          value: 'INE',
                          groupValue: major,
                          onChanged: (v) => setState(() => major = v!),
                        ),
                        const Text('INE'),
                        Radio<String>(
                          value: 'INET',
                          groupValue: major,
                          onChanged: (v) => setState(() => major = v!),
                        ),
                        const Text('INET'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            /* ---------- Courses ---------- */
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '2. รายวิชาและคะแนน',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (int i = 0; i < 4; i++) courseCard(i),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /* ---------- Calculate Button ---------- */
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.calculate),
                label: const Text('คำนวณเกรด', style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: calculateGrade,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget courseCard(int index) {
    return Card(
      color: Colors.grey.shade50,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'วิชา ${index + 1}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedSubjects[index],
              decoration: const InputDecoration(
                labelText: 'เลือกรายวิชา',
                border: OutlineInputBorder(),
              ),
              items: subjects
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) => setState(() => selectedSubjects[index] = v!),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                scoreBox(
                  scoreCtrl[index * 3],
                  'คะแนนเก็บ',
                  Icons.assignment_turned_in,
                ),
                scoreBox(scoreCtrl[index * 3 + 1], 'กลางภาค', Icons.event_note),
                scoreBox(scoreCtrl[index * 3 + 2], 'ปลายภาค', Icons.fact_check),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget scoreBox(TextEditingController ctrl, String label, IconData icon) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
