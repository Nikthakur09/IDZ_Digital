// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:assignment/model/employee.dart';

class EmployeeDetails extends StatelessWidget {
  final Employee employee;

  const EmployeeDetails({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121113),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text("Employee Details",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF121113),
      ),
      body: Center(
        child: Container(
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(employee.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  )),
              Center(
                child: Text(employee.age.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Text(employee.salary.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
