import 'package:empat_app/models/student.dart';
import 'package:empat_app/providers/steppers_provider.dart';
import 'package:empat_app/providers/student_provider.dart';
import 'package:empat_app/routes/routes.dart';
import 'package:empat_app/widgets/info/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'custom_app_bar.dart';
import 'my_table.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    final appBarSize = Size(phoneSize.width, phoneSize.height * 0.05);
    return Scaffold(
      appBar: CustomAppBar(size: appBarSize),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const MyTable(),
          ElevatedButton(
            onPressed: () {
              context.read<StudentProvider>().student = Student();
              context.read<SteppersProvider>().reset();
              Navigator.of(context).pushNamed(RouteGenerator.infoScreen);
            },
            child: const Text("Add a student"),
          ),
        ],
      ),
    );
  }
}
