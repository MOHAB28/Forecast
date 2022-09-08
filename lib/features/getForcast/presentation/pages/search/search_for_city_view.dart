import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_2/core/presentation/extensions.dart';
import '../../../../../core/presentation/fonts_manager.dart';
import '../../../../../core/presentation/icons.dart';
import '../../../../../core/presentation/styles_manager.dart';
import '../../../../forcastDatabase/presentation/cubit/forcastdatabase_cubit.dart';
import '../../cubit/getforcast_cubit.dart';
import '../../widgets/back_ground_widget.dart';
import '../../widgets/current_forcast_details.dart';
import '../../widgets/golden_button.dart';

class SerchForAreaView extends StatefulWidget {
  const SerchForAreaView({super.key});

  @override
  State<SerchForAreaView> createState() => _SerchForAreaViewState();
}

class _SerchForAreaViewState extends State<SerchForAreaView> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundWidgetBuilder(),
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(IconBroken.arrowLeft_2),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: BlocBuilder<GetForcastCubit, GetForcastState>(
            builder: (context, state) {
              var forcastData = GetForcastCubit.get(context).forcastDataByName;
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: TextFormField(
                          controller: _controller,
                          autofocus: true,
                          style: getLightStyle(
                            fontSize: FontSize.s14,
                            color: Colors.white,
                          ),
                          onFieldSubmitted: (value) {
                            if (value.isNotEmpty) {
                              GetForcastCubit.get(context, listen: false)
                                  .getForcastByCityName(value.trim());
                            } else {
                              FlushbarHelper.createError(
                                message: 'Please enter the city name',
                              ).show(context);
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(
                              IconBroken.search,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      const SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 20.0)),
                      if (_controller.text.isNotEmpty) ...[
                        SliverToBoxAdapter(
                          child: forcastData != null
                              ? Column(
                                  children: [
                                    Text(
                                      DateFormat('MMMM d,yyyy')
                                          .format(DateTime.now()),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const SizedBox(height: 30.0),
                                    Image(
                                      image: AssetImage(forcastData
                                          .currentForcast.icon
                                          .imagePath()),
                                      height: 300.0,
                                      width: 300.0,
                                    ),
                                    const SizedBox(height: 25.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CurrentForcastDetailsWidget(
                                          title: 'Temp',
                                          details:
                                              '${forcastData.currentForcast.temp}°',
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: CurrentForcastDetailsWidget(
                                            title: 'wind',
                                            details:
                                                '${forcastData.currentForcast.windSpeed}km/h',
                                          ),
                                        ),
                                        CurrentForcastDetailsWidget(
                                          title: 'Humidity',
                                          details:
                                              '${forcastData.currentForcast.humidity}%',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 40.0),
                                    GoldenButton(
                                      title: 'Add to home',
                                      onTap: () {
                                        if (_controller.text.isNotEmpty) {
                                          ForcastDatabaseCubit.get(context,
                                                  listen: false)
                                              .addOrUpdateCity(
                                                CubitInput(
                                                  cityName:
                                                      _controller.text.trim(),
                                                  icon: forcastData
                                                      .currentForcast.icon,
                                                  temp: forcastData
                                                      .currentForcast.temp,
                                                  description: forcastData
                                                      .currentForcast
                                                      .mainTitle,
                                                ),
                                              )
                                              .then((_) =>
                                                  FlushbarHelper.createSuccess(
                                                    message:
                                                        'Added Successfully',
                                                  ).show(context))
                                              .catchError((error) {
                                            debugPrint(error.toString());
                                          });
                                        } else {
                                          FlushbarHelper.createError(
                                            message:
                                                'Please enter the city name',
                                          ).show(context);
                                        }
                                      },
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Text(
                                    'Wait a minute....',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                        ),
                      ]
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
