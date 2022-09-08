import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/presentation/extensions.dart';
import '../../../../../../core/presentation/color_manager.dart';
import '../../../cubit/getforcast_cubit.dart';
import '../../../widgets/current_forcast_details.dart';
import '../../../widgets/forecast_hourly_item_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetForcastCubit, GetForcastState>(
      builder: (context, state) {
        var forcastData = GetForcastCubit.get(context).forcastData;
        var cityDetails = GetForcastCubit.get(context).cityDetails;
        if (forcastData != null && cityDetails != null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                cityDetails.cityName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20.0),
              Text(
                DateFormat('MMMM d,yyyy').format(DateTime.now()),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 30.0),
              Image(
                image:
                    AssetImage(forcastData.currentForcast.icon.imagePath()),
                height: 300.0,
                width: 300.0,
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CurrentForcastDetailsWidget(
                    title: 'Temp',
                    details: '${forcastData.currentForcast.temp}°',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CurrentForcastDetailsWidget(
                      title: 'wind',
                      details:
                          '${forcastData.currentForcast.windSpeed}km/h',
                    ),
                  ),
                  CurrentForcastDetailsWidget(
                    title: 'Humidity',
                    details: '${forcastData.currentForcast.humidity}%',
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Today',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                height: 110,
                child: ListView.separated(
                   padding: const EdgeInsets.only(left:8.0),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: forcastData.hourlyForcast.length,
                  itemBuilder: (ctx, i) {
                    return ForecastItemBuilder(
                      forcast: forcastData.hourlyForcast[i],
                      i: i,
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: 15.0);
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.golden,
            ),
          );
        }
      },
    );
  }
}
