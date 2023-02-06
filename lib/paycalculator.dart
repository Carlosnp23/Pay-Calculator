// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';

class EmployeeSalary extends StatefulWidget {
  const EmployeeSalary({Key? key}) : super(key: key);

  @override
  State<EmployeeSalary> createState() => _EmployeeSalaryState();
}

class _EmployeeSalaryState extends State<EmployeeSalary> {
  @override
  Widget build(BuildContext context) {
    final taxpay = TextEditingController();
    final noofhours = TextEditingController();
    final hourlyrate = TextEditingController();
    final regularpay = TextEditingController();
    final overtime = TextEditingController();
    final totalpay = TextEditingController();
    var size = MediaQuery.of(context).size;
    double result;
    double no_of_hours;
    double hourly_rate;
    double tax_pay;
    double total_pay;
    double regular_pay;
    double over_time;
    double sum = 0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Pay Calculator",
                style: TextStyle(fontSize: 30, color: Colors.black)),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: noofhours,
              decoration: InputDecoration(
                  labelText: "Number of hours",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: hourlyrate,
              decoration: InputDecoration(
                  labelText: "Hourly rate",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: regularpay,
              decoration: InputDecoration(
                  labelText: "Regular Pay",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: overtime,
              decoration: InputDecoration(
                  labelText: "Overtime Pay",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: totalpay,
              decoration: InputDecoration(
                  labelText: "Total Pay",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: taxpay,
              decoration: InputDecoration(
                  labelText: "Tax",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                no_of_hours = double.parse(noofhours.text);
                hourly_rate = double.parse(hourlyrate.text);

                if (no_of_hours <= 40) {
                  total_pay = no_of_hours * hourly_rate;
                  regularpay.text = total_pay.toString();
                } else if (no_of_hours > 40) {
                  total_pay =
                      (no_of_hours - 40) * hourly_rate * 1.5 + 40 * hourly_rate;

                  regular_pay = no_of_hours * hourly_rate;
                  regularpay.text = regular_pay.toString();

                  over_time = (no_of_hours - 40) * hourly_rate;
                  overtime.text = over_time.toString();

                  total_pay = (regular_pay + over_time);
                  totalpay.text = total_pay.toString();

                  tax_pay = total_pay * 0.18;
                  taxpay.text = tax_pay.toString();
                } else {
                  total_pay = 0;
                }

                result = sum;
              },
              child: Container(
                alignment: Alignment.center,
                height: size.height / 14,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
