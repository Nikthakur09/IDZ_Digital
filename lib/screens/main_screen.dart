import 'package:assignment/screens/employee_details.dart';
import 'package:assignment/services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:assignment/model/employee.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ApiClient apiClient = ApiClient();
  late Future<List<Employee>> employees;

  @override
  void initState() {
    super.initState();
    employees = apiClient.getData(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EmployeeDummy",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF121113),
      ),
      body: FutureBuilder<List<Employee>>(
        future: employees,
        builder:
            (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No employees found'));
          }

          List<Employee> employeeList = snapshot.data!;

          return ListView.builder(
            itemCount: employeeList.length,
            itemBuilder: (BuildContext context, int index) {
              Employee employee = employeeList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: .5),
                child: ListTile(
                  horizontalTitleGap: 100,
                  minVerticalPadding: 20,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EmployeeDetails(employee: employee),
                      ),
                    );
                  },
                  tileColor: const Color(0xFF121113),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        employee.name,
                        style: const TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      Text(employee.age.toString(),
                          style: const TextStyle(fontSize: 22, color: Colors.white)),
                      Text(employee.salary.toString(),
                          style: const TextStyle(fontSize: 22, color: Colors.white)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
