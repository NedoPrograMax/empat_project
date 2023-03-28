import 'package:empat_app/core/utils.dart';
import 'package:empat_app/providers/fail_continue_taps_provider.dart';
import 'package:empat_app/providers/image_picker_provider.dart';

import 'package:empat_app/providers/steppers_provider.dart';
import 'package:empat_app/providers/student_provider.dart';
import 'package:empat_app/providers/students_provider.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyStepper extends StatelessWidget {
  const MyStepper({super.key});

  void dealWithFailureTaps(BuildContext context) {
    context.read<FailContinueTapsProvider>().inrement();

    if (context.read<FailContinueTapsProvider>().failedTaps > 5) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "There are some problems with your input.\nPlease be so kind to deal with them and then press the button."),
        ),
      );
    }
    if (context.read<FailContinueTapsProvider>().failedTaps > 10) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: const Text(
              "There are some problems with your input.\nPlease be so kind to deal with them and then press the button."),
          actions: [
            ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }

  bool isStepCompleted(int step, BuildContext context) {
    final form = getFormKeyById(step);
    if (form == null || form.currentState?.validate() == true) {
      if (step == 0) {
        return true;
      }
      if (step == 1) {
        return true;
        //  return // radioForm.currentState?.validate() ?? false;
      }
      if (step == 2) {
        final chosenImage =
            Provider.of<ImagePickerProvider>(context, listen: false).image;
        final image =
            chosenImage ?? context.read<StudentProvider>().student.avatar;
        if (image != null) {
          context.read<StudentProvider>().student.avatar = image;
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SteppersProvider>(
      builder: (context, stepsProvider, child) => Expanded(
        child: Stepper(
          steps: stepsProvider.steps,
          currentStep: stepsProvider.currentStep,
          onStepContinue: Provider.of<SteppersProvider>(context, listen: false)
              .incrementStep,
          onStepCancel: Provider.of<SteppersProvider>(context, listen: false)
              .decrementStep,
          controlsBuilder: (context, details) => Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  final form = getFormKeyById(details.currentStep);
                  if (isStepCompleted(details.currentStep, context)) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    context.read<FailContinueTapsProvider>().reset();

                    form?.currentState?.save();
                    details.onStepContinue!();
                    if (details.currentStep == stepsProvider.steps.length - 1) {
                      context
                          .read<StudentsProvider>()
                          .addStudent(context.read<StudentProvider>().student);
                      Navigator.of(context).pop();
                    }
                  } else {
                    dealWithFailureTaps(context);
                  }
                },
                child: Text(
                  details.currentStep != stepsProvider.steps.length - 1
                      ? "Continue"
                      : "Finish",
                ),
              ),
              if (details.currentStep != 0)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text("Go back"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
