import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_2/features/getForcast/presentation/widgets/golden_button.dart';
import '../../../../../core/presentation/color_manager.dart';
import '../../widgets/back_ground_widget.dart';
import '../../../../../core/presentation/assets_manager.dart';
import '../../../../../injection_container.dart';
import '../layout/layout_view.dart';

const String welcomeKey = 'welcomeKey';

class WelcomeViewPage extends StatefulWidget {
  static const String welcomeKey = '/WelcomeViewPage';
  const WelcomeViewPage({Key? key}) : super(key: key);

  @override
  State<WelcomeViewPage> createState() => _WelcomeViewPageState();
}

class _WelcomeViewPageState extends State<WelcomeViewPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    sl<SharedPreferences>().setBool(welcomeKey, true);
    super.initState();
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticInOut,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundWidgetBuilder(),
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 1.0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SlideTransition(
                position: _offsetAnimation,
                child: const Image(
                  image: AssetImage(AssetsManager.thunderstormClouds),
                  height: 250.0,
                  width: 250.0,
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Weather ',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 40.0),
                  children: [
                    TextSpan(

                      text: 'News &Feed',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: ColorManager.golden, fontSize: 40.0),
                    ),
                  ],
                ),
              ),
              GoldenButton(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LayoutView()));
                  },
                  title: 'Get started'),
            ],
          ),
        ),
      ],
    );
  }
}
