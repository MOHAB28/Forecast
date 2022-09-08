import 'package:flutter/material.dart';

import '../../../../core/presentation/color_manager.dart';

class BackGroundWidgetBuilder extends StatelessWidget {
  const BackGroundWidgetBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: ColorManager.gradientBackgroundScaffold,
        ),
      ),
    );
  }
}
