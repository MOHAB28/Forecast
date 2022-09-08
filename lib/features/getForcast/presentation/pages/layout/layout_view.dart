import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../forcastDatabase/presentation/cubit/forcastdatabase_cubit.dart';
import '../../../../../core/presentation/color_manager.dart';
import '../../../../../core/presentation/icons.dart';
import '../../cubit/bottom_nav_cubit/bottom_nav_cubit.dart';
import '../../cubit/getforcast_cubit.dart';
import '../../widgets/back_ground_widget.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    GetForcastCubit.get(context, listen: false)
        .getCitydetailsByCurrentLocation()
        .whenComplete(() {
      GetForcastCubit.get(context, listen: false).getForcastByCurrentLocation();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundWidgetBuilder(),
        BlocBuilder<BotomNavCubit, BottomNavStates>(
          builder: (context, state) {
            var cubit = BotomNavCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 1.0,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 15.0),
                child: cubit.screens[cubit.currentIndex],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  BotomNavCubit.get(context, listen: false)
                      .changeCurrentIndex(index);
                      if(index == 1) {
                        ForcastDatabaseCubit.get(context,listen: false).getAllCities();
                      }
                },
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.home,
                      color: Colors.white,
                    ),
                    activeIcon: Icon(
                      IconBroken.home,
                      color: ColorManager.golden,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.search,
                      color: Colors.white,
                    ),
                    activeIcon: Icon(
                      IconBroken.search,
                      color: ColorManager.golden,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.calendar,
                      color: Colors.white,
                    ),
                    activeIcon: Icon(
                      IconBroken.calendar,
                      color: ColorManager.golden,
                    ),
                    label: '',
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
