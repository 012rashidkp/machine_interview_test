import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_interview_test/features/shared/bloc/appversion_bloc.dart';
import 'package:machine_interview_test/features/shared/component/loadingbar.dart';
import 'package:machine_interview_test/features/shared/component/textcomponent.dart';
import 'package:machine_interview_test/features/shared/resources/color.dart';

class Versioncomponent extends StatelessWidget {
  const Versioncomponent({super.key});

  @override
  Widget build(BuildContext context) {
    AppversionBloc appversionBloc=AppversionBloc();
    appversionBloc.add(AppversionEvent());
    return BlocProvider(
      create: (_) => appversionBloc,
      child: BlocBuilder<AppversionBloc, AppversionState>(

        builder: (context, state) {
          if (state is AppversionInitial || state is AppversionLoading) {
            return const Loadingbar(
              color: tealcolor,
            );
          } else if (state is AppversionLoaded) {
            return Textcomponent(
              text: 'Version ${state.response?.data?.version}',
              fontsize: 16,
              fontWeight: FontWeight.w500,
              color: tealcolor,
            );
          } else if (state is AppversionError) {
            return Textcomponent(
              text: state.error,
              fontsize: 16,
              fontWeight: FontWeight.w500,
              color: tealcolor,
            );
          } else {
            return Container();
          }
        },
      ),
    );

  }
}
