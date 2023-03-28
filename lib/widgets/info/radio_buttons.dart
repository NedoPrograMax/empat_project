import 'package:empat_app/providers/student_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class RadioButtons extends StatelessWidget {
  const RadioButtons(this.form, {super.key});
  final GlobalKey<FormBuilderState> form;

  @override
  Widget build(BuildContext context) {
    final buttons = List.generate(
      6,
      (index) => FormBuilderFieldOption(
        value: index + 1,
        child: Text("${index + 1} years"),
      ),
    );
    return FormBuilderRadioGroup(
      initialValue: context.read<StudentProvider>().student.yearOfStudying,
      key: form,
      validator: (value) => value == null ? "Choose one option" : null,
      name: "Years of studying",
      options: buttons,
      onChanged: (value) =>
          context.read<StudentProvider>().student.yearOfStudying = value ?? 1,
    );
  }
}
