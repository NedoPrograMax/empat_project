import 'package:empat_app/providers/student_provider.dart';
import 'package:empat_app/providers/students_provider.dart';
import 'package:empat_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/steppers_provider.dart';

class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<StudentsProvider>(context).students;
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text("Name"),
          ),
          DataColumn(
            label: Text("University"),
          ),
          DataColumn(
            label: Text("Course"),
            numeric: true,
          ),
          DataColumn(
            label: Text("Avatar"),
          ),
        ],
        rows: students
            .map(
              (student) => DataRow(
                color: MaterialStateProperty.all(student.color),
                cells: [
                  DataCell(
                    Text(student.firstName + "\n" + student.lastName),
                  ),
                  DataCell(
                    Text(student.university),
                  ),
                  DataCell(
                    Text(student.yearOfStudying.toString()),
                  ),
                  DataCell(
                    CircleAvatar(
                      backgroundImage: student.avatar,
                      backgroundColor: Colors.transparent,
                    ),
                  )
                ],
                onLongPress: () {
                  context.read<StudentProvider>().student = student;
                  context.read<SteppersProvider>().reset();
                  Navigator.of(context).pushNamed(RouteGenerator.infoScreen);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
