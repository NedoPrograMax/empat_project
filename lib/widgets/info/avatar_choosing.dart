import 'package:empat_app/providers/image_picker_provider.dart';
import 'package:empat_app/providers/student_provider.dart';
import 'package:empat_app/widgets/info/colors_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'no_image.dart';

class AvatarChoosing extends StatelessWidget {
  const AvatarChoosing({super.key});

  @override
  Widget build(BuildContext context) {
    final choosedImage = context.watch<ImagePickerProvider>().image;
    final image =
        choosedImage ?? context.read<StudentProvider>().student.avatar;
    return Column(
      children: [
        InkWell(
          onTap: context.read<ImagePickerProvider>().pickImage,
          borderRadius: BorderRadius.circular(70),
          child: Ink(
            child: CircleAvatar(
              backgroundImage: image,
              radius: 70,
              child: image == null ? const NoImage() : null,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const ColorsList(),
      ],
    );
  }
}
