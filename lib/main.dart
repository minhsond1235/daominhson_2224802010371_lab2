import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LayoutApp(),
      ),
    );
  }
}

class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc [cite: 10]
      children: [
        const Text("I'm in a Column and Centered. The below is a row."),
        const SizedBox(height: 20), // Tạo khoảng cách [cite: 20]
        
        // Hàng ngang chứa 3 ô màu [cite: 84]
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Chia đều khoảng cách [cite: 12]
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 100, height: 100, color: Colors.green),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 100, height: 100, color: Colors.blue),
            ),
          ],
        ),
        
        const SizedBox(height: 20),
        
        // Chồng văn bản lên hộp màu vàng [cite: 99]
        Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 300, height: 200, color: Colors.yellow),
            const Text(
              'Stacked on Yellow Box',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}