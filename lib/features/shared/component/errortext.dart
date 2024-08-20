
import 'package:flutter/cupertino.dart';
import 'package:machine_interview_test/features/shared/component/textcomponent.dart';
import 'package:machine_interview_test/features/shared/resources/color.dart';

class Errortext extends StatelessWidget {
  final String? errortext;

  const Errortext({this.errortext});

  @override
  Widget build(BuildContext context) {
    return Textcomponent(
      text: errortext,
      fontsize: 15,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: tealcolor,

    );
  }
}
