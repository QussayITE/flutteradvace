import 'package:flutter/material.dart';
import 'package:flutteradvace/core/helpers/extensions.dart';
import 'package:flutteradvace/core/routing/routes.dart';
import 'package:flutteradvace/core/theming/colors.dart';
import 'package:flutteradvace/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.pushNamed(Routes.loginScreen);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 52),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
        child: Text(
          'Get Started',
          style: TextStyles.font16WhiteSemiBold,
        ));
  }
}
