import 'package:empat_app/models/student.dart';
import 'package:empat_app/widgets/info/avatar_choosing.dart';
import 'package:empat_app/widgets/info/name_entering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../widgets/info/university_entering.dart';

final nameForm = GlobalKey<FormState>();
final universityForm = GlobalKey<FormState>();
final radioForm = GlobalKey<FormBuilderState>();

final constantSteps = [
  Step(
    title: const Text("Name"),
    content: NameEntering(nameForm),
    isActive: true,
    state: StepState.editing,
  ),
  Step(
    title: const Text("Education"),
    content: UniversityEntering(
      form: universityForm,
      radioForm: radioForm,
    ),
  ),
  const Step(
    title: Text("Avatar"),
    content: AvatarChoosing(),
  ),
];

final constStudents = [
  Student(
      firstName: "Ahatanhel",
      lastName: "Krtmskyy",
      university: "KNU",
      color: Colors.red,
      yearOfStudying: 4,
      avatar: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/4/4b/Agatangel_Krymskyi.jpg")),
  Student(
      firstName: "Ivan",
      lastName: "Mazepa",
      university: "NAUKMA",
      color: Colors.purple,
      yearOfStudying: 5,
      avatar: NetworkImage(
          "https://th.bing.com/th/id/R.c99137b307da68594454a4b9406961ea?rik=cQ6zlU0%2ffHMjyQ&pid=ImgRaw&r=0")),
  Student(
      firstName: "Sergiy",
      lastName: "Korolov",
      university: "KPI",
      color: Colors.blue,
      yearOfStudying: 4,
      avatar: NetworkImage(
          "https://th.bing.com/th/id/OIP.4PRXet4hlAM-PLpIanO5wQHaJx?pid=ImgDet&rs=1")),
  Student(
      firstName: "Pylyp",
      lastName: "Orlyk",
      university: "NAUKMA",
      color: Colors.amber,
      yearOfStudying: 4,
      avatar: NetworkImage(
          "https://th.bing.com/th/id/R.a7053dc21f1caf024924698d5b924274?rik=%2fMaLIT9pMzahpQ&riu=http%3a%2f%2fslovopys.kubg.edu.ua%2fwp-content%2fuploads%2f2020%2f06%2fPYLYP-ORLYK-768x511.jpg&ehk=XTbWSCf4l8Z%2bfJNRLgAVnlV3PU8Pz2ldz0PjU4ofYdk%3d&risl=&pid=ImgRaw&r=0")),
  Student(
      firstName: "Valerii",
      lastName: "Zaluzhnyi",
      university: "NUOA",
      color: Colors.green,
      yearOfStudying: 4,
      avatar: NetworkImage(
          "https://th.bing.com/th?id=ODL.3aca5babe77ba151bedb89f9590ca3ae&w=143&h=232&c=12&rs=1&qlt=99&pcl=faf9f7&o=6&pid=13.1")),
];

const colors = [
  Colors.red,
  Colors.blue,
  Colors.amber,
  Colors.purple,
  Colors.green,
  Colors.lightBlue,
];
