import 'package:flutter/material.dart';

class Rec extends StatelessWidget {
  final double height;
  final double width;
  final double length;
  final String Type;

  const Rec({
    super.key,
    required this.height,
    required this.width,
    required this.length,
    required this.Type,
  });

  @override
  Widget build(BuildContext context) {
    double area = height * width;
    double volume = height * width * length;

    bool isArea = Type == "Area";

    return Scaffold(
      appBar: AppBar(
        title: Text(isArea ? "Rectangle Area" : "Rectangle Volume"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// 🔷 Icon 3D
                Icon(
                  isArea ? Icons.square_outlined : Icons.view_in_ar,
                  size: 60,
                  color: isArea ? Colors.blue : Colors.deepPurple,
                ),
                const SizedBox(height: 16),

                /// 🔹 Dimension info
                _infoText("Height", height),
                _infoText("Width", width),
                if (!isArea) _infoText("Length", length),

                const Divider(height: 30, thickness: 1),

                /// 🔥 Result
                Text(
                  isArea
                      ? "Area = ${area.toStringAsFixed(2)}"
                      : "Volume = ${volume.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Widget แสดงข้อมูลแต่ละบรรทัด
  Widget _infoText(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$label : ", style: const TextStyle(fontSize: 18)),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
