import 'package:empat_app/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameEntering extends StatelessWidget {
  NameEntering(
    this._form, {
    super.key,
  });
  final GlobalKey<FormState> _form;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        children: [
          TextFormField(
            initialValue: context.read<StudentProvider>().student.firstName,
            decoration:
                const InputDecoration(hintText: "Enter your first name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter something";
              } else if (value.length < 3) {
                return "Name's length cannot be less than 3";
              }
              return null;
            },
            onSaved: (newValue) => context
                .read<StudentProvider>()
                .student
                .firstName = newValue ?? "",
          ),
          TextFormField(
            initialValue: context.read<StudentProvider>().student.lastName,
            decoration: const InputDecoration(hintText: "Enter your last name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter something";
              } else if (value.length < 3) {
                return "Name's length cannot be less than 3";
              }
              return null;
            },
            onSaved: (newValue) => context
                .read<StudentProvider>()
                .student
                .lastName = newValue ?? "",
          ),
        ],
      ),
    );
  }
}
