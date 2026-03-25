import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String surname;
  final String major;
  final List<Map<String, dynamic>> results;

  const ResultPage({
    super.key,
    required this.name,
    required this.surname,
    required this.major,
    required this.results,
  });

  Color gradeColor(String grade) {
    switch (grade) {
      case 'A':
        return Colors.green;
      case 'B+':
        return Colors.lightBlue;
      case 'B':
        return Colors.blue;
      case 'C+':
        return Colors.cyan;
      case 'C':
        return Colors.orange;
      case 'D+':
        return Colors.amber;
      case 'D':
        return Colors.deepOrange;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('ผลการเรียน'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /* ---------- Student Info ---------- */
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.school, size: 40),
                title: Text(
                  '$name $surname',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('สาขา: $major'),
              ),
            ),

            const SizedBox(height: 16),

            /* ---------- Course Results ---------- */
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final r = results[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /* Subject + Grade */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  r['subject'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: gradeColor(r['grade']),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  r['grade'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          /* Scores */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              scoreItem('คะแนนเก็บ', r['keep']),
                              scoreItem('คะแนนกลางภาค', r['mid']),
                              scoreItem('คะแนนปลายภาค', r['final']),
                              scoreItem('รวม', r['total'], isTotal: true),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            /* ---------- Back Button ---------- */
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('กลับไปแก้ไข'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget scoreItem(String label, int value, {bool isTotal = false}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 4),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: isTotal ? Colors.orangeAccent.shade700 : Colors.black,
          ),
        ),
      ],
    );
  }
}
