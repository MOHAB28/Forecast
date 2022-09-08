import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/presentation/color_manager.dart';
import '../../../../../../core/presentation/icons.dart';
import '../../../cubit/getforcast_cubit.dart';
import '../../../widgets/forecast_hourly_item_builder.dart';
import '../../../widgets/next_forecast_item.dart';

class NextForcastView extends StatelessWidget {
  const NextForcastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetForcastCubit, GetForcastState>(
      builder: (context, state) {
        var forcastData = GetForcastCubit.get(context).forcastData;
        if (forcastData != null) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Forecast report',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Today',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      DateFormat('MMMM d,yyyy').format(DateTime.now()),
                      style: Theme.of(context).textTheme.bodySmall,
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
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Next forecast',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Icon(
                      IconBroken.calendar,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: forcastData.dailyForcast.length,
                  itemBuilder: (ctx, i) {
                    return NewtForecastItemBuilder(
                      forcast: forcastData.dailyForcast[i],
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      height: 15.0,
                    );
                  },
                )
              ],
            ),
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

