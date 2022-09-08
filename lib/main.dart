import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/presentation/theme_manager.dart';
import 'features/forcastDatabase/presentation/cubit/forcastdatabase_cubit.dart';
import 'features/getForcast/presentation/cubit/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'features/getForcast/presentation/cubit/getforcast_cubit.dart';
import 'features/getForcast/presentation/pages/layout/layout_view.dart';
import 'features/getForcast/presentation/pages/welcome/welcome_view.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  late Widget widget;
  bool? welcome = sl<SharedPreferences>().getBool(welcomeKey);
  if (welcome == null) {
    widget = const WelcomeViewPage();
  } else {
    widget = const LayoutView();
  }
  runApp(MyApp(widget: widget));
}

class MyApp extends StatelessWidget {
  final Widget widget;
  const MyApp({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BotomNavCubit>(
          create: (context) => BotomNavCubit(),
        ),
        BlocProvider<GetForcastCubit>(
          create: (context) => sl<GetForcastCubit>(),
        ),
        BlocProvider<ForcastDatabaseCubit>(
          create: (context) => sl<ForcastDatabaseCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        home: widget,
      ),
    );
  }
}
