import 'package:empat_app/providers/student_provider.dart';
import 'package:empat_app/widgets/info/radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class UniversityEntering extends StatelessWidget {
  const UniversityEntering({
    required this.form,
    required this.radioForm,
    super.key,
  });
  final GlobalKey<FormState> form;
  final GlobalKey<FormBuilderState> radioForm;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: context.read<StudentProvider>().student.university,
            decoration:
                const InputDecoration(hintText: "Enter your university"),
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
                .university = newValue ?? "",
          ),
          RadioButtons(radioForm),
        ],
      ),
    );
  }
}
