import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/presentation/extensions.dart';
import '../../../../core/presentation/color_manager.dart';
import '../../domain/entities/get_forcast_entity.dart';

class ForecastItemBuilder extends StatelessWidget {
  final HourlyForcast forcast;
  final int i;
  const ForecastItemBuilder({
    Key? key,
    required this.forcast,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          width: 160.0,
          decoration: i == 0
              ? ShapeDecoration(
                  color: ColorManager.skycolor,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  shadows: const [
                      BoxShadow(
                        color: ColorManager.lightSkycolor,
                        blurRadius: 0.0,
                        blurStyle: BlurStyle.solid,
                        spreadRadius: 5.0,
                      ),
                    ])
              : ShapeDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(forcast.icon.imagePath()),
                height: 65.0,
                width: 65.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat('H.mm').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            forcast.dateTime * 1000)),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${forcast.temp}',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        '°C',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
