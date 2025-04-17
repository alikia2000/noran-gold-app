
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'قیمت پودر نوران',
      theme: ThemeData(
        fontFamily: 'Vazir',
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  int mesghalPrice = 0;
  double resultNormal = 0;
  double resultLimooei = 0;

  void calculatePrices() {
    double base = mesghalPrice / 3.249;
    resultNormal = base + 1400000;
    resultLimooei = resultNormal + 50000;
    setState(() {});
  }

  String formatPrice(double price) {
    final format = NumberFormat('#,###');
    return format.format(price.round());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'مظنه هر مثقال را وارد کنید یا دریافت قیمت روز را بزنید',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'مظنه طلا (تومان)',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                mesghalPrice = int.tryParse(_controller.text) ?? 0;
                calculatePrices();
              },
              child: const Text('محاسبه قیمت'),
            ),
            const SizedBox(height: 30),
            if (resultNormal > 0) ...[
              Text('زرد شمشی: ${formatPrice(resultNormal)} تومان'),
              Text('زعفرانی: ${formatPrice(resultNormal)} تومان'),
              Text('لیمویی: ${formatPrice(resultLimooei)} تومان'),
            ]
          ],
        ),
      ),
    );
  }
}
