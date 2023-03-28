import 'package:empat_app/providers/fail_continue_taps_provider.dart';
import 'package:empat_app/providers/image_picker_provider.dart';

import 'package:empat_app/providers/steppers_provider.dart';
import 'package:empat_app/providers/student_provider.dart';
import 'package:empat_app/widgets/main/custom_app_bar.dart';
import 'package:empat_app/widgets/info/my_stepper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Info")),
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 18),
          MultiProvider(
            providers: [
              Provider(
                create: (context) => FailContinueTapsProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => ImagePickerProvider(),
              ),
            ],
            child: const MyStepper(),
          )
        ],
      ),
    );
  }
}
