import 'package:empat_app/state/bloc/app_bloc.dart';
import 'package:empat_app/state/bloc/app_state.dart';
import 'package:empat_app/widgets/dialogs/loading_dialog.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'city_picker_dialog.dart';
import 'error_dialog.dart';

class MultiDialog extends StatelessWidget {
  const MultiDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.errorMessage != null) {
          return ErrorDialog(state.errorMessage!);
        } else if (state.isLoading) {
          return const LoadingDialog();
        } else {
          return const CityPickerDialog();
        }
      },
    );
  }
}
