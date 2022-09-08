import 'package:flutter/material.dart';
import '../../../../core/presentation/extensions.dart';
import '../../../../core/presentation/color_manager.dart';
import '../../../forcastDatabase/domain/entities/forcast_database_entity.dart';

class SearchItemOfSearchView extends StatelessWidget {
  const SearchItemOfSearchView({
    Key? key,
    required this.forcast,
    required this.i,
  }) : super(key: key);
  final int i;
  final ForcastDatabaseEntity forcast;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: i % 2 == 0? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${forcast.temp}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '°',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          forcast.description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Image(
                      image: AssetImage(forcast.icon.imagePath()),
                      height: 45,
                      width: 45,
                    )
                  ],
                ),
                Text(
                  forcast.cityName,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
