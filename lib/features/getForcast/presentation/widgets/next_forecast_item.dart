import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/presentation/extensions.dart';
import '../../domain/entities/get_forcast_entity.dart';

class NewtForecastItemBuilder extends StatelessWidget {
  final DailyForcast forcast;
  const NewtForecastItemBuilder({
    Key? key,
    required this.forcast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: ShapeDecoration(
        color: Colors.grey.withOpacity(0.1),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('EEEE').format(DateTime.fromMillisecondsSinceEpoch(
                    forcast.dateTime * 1000)),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8.0),
              Text(
                DateFormat('MMMM, d').format(
                    DateTime.fromMillisecondsSinceEpoch(
                        forcast.dateTime * 1000)),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${forcast.temp}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                '°C',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          Image(
            image: AssetImage(forcast.icon.imagePath()),
            height: 65.0,
            width: 65.0,
          )
        ],
      ),
    );
  }
}
