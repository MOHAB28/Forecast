import 'package:flutter/material.dart';
import '../../../../core/presentation/color_manager.dart';

class GoldenButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const GoldenButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: ColorManager.golden,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
